import cmd
import os
import time
import webbrowser

from rich import print
from rich.console import Console

from .conn import CantConnectToDbError, get_db_connection
from .utils import query_to_rich_table

console = Console()


class VueiShell(cmd.Cmd):
    prompt = ">=- "

    def __init__(self):
        super(VueiShell, self).__init__()
        try:
            self.conn = get_db_connection()
            self.cur = self.conn.cursor()
        except CantConnectToDbError:
            exit(1)

        if not self._is_initialized():
            self._populate_db()

        print("Bem-vindo ao [bold]VUEI DEMAIS[/bold]!")
        print("Digite help ou ? para listar os comandos ou Ctrl+C para sair.")

    def _is_initialized(self):
        self.cur.execute(
            "SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'guerra')"
        )
        return self.cur.fetchone()[0]

    def _populate_db(self):
        print("[bold green]Inicializando o banco de dados...[/bold green]")
        file_names = ["esquema.sql", "dados.sql"]
        for file_name in file_names:
            print(f"[bold green]Executando {file_name}...[/bold green]")
            file_path = os.path.join(os.path.dirname(__file__), f"../sql/{file_name}")
            with open(file_path, "r") as file:
                self.cur.execute(file.read())

        print()
        self.conn.commit()

    def pretty_query(self, query: str):
        table = query_to_rich_table(self.cur, query)
        return table

    def do_apagar_banco(self, arg):
        """Apaga o banco de dados conectado INTEIRO. Use com cuidado!"""
        SECONDS = 10
        print(
            f"[bold red]Apagando TODO o banco de dados em {SECONDS} segundos... Pressione Ctrl+C para cancelar.[/bold red]"
        )
        time.sleep(SECONDS)
        self.cur.execute("DROP SCHEMA public CASCADE; CREATE SCHEMA public;")
        self.conn.commit()
        print("[bold green]Banco de dados apagado com sucesso![/bold green]")

    def do_listar_expedicoes(self, arg):
        """Lista expedições disponíveis para reserva."""
        try:
            table = self.pretty_query(
                """
                SELECT EX.ROTA, EX.NAVE, EX.DH_INICIO, ((NV.CAPACIDADE - 1) - COUNT(ET.TURISTA)) AS VAGAS_RESTANTES
                FROM EXPEDICAO EX JOIN NAVE NV
                    ON EX.NAVE = NV.NUMERO_REGISTRO
                    LEFT JOIN EXPEDICAO_TURISTA ET
                        ON ET.NAVE = EX.NAVE AND ET.DH_INICIO = EX.DH_INICIO
                GROUP BY EX.NAVE, EX.DH_INICIO, NV.CAPACIDADE
                HAVING COUNT(ET.TURISTA) < NV.CAPACIDADE - 1
                    AND CURRENT_DATE < EX.DH_INICIO;"""
            )
            console.print(table)
        except Exception as e:
            print(e)

    def do_listar_turistas(self, arg):
        """Lista todos os turistas."""
        try:
            table = self.pretty_query(
                """
                SELECT NOME, TURISTA.EMAIL
                FROM TURISTA JOIN PESSOA
                    ON TURISTA.EMAIL = PESSOA.EMAIL;
                """
            )
            console.print(table)
        except Exception as e:
            print(e)

    def do_registrar_turista_em_expedicao(self, arg):
        """Registra um turista em uma expedição."""
        print("Turista registrado com sucesso!")

    def _sair(self):
        print(f"Saindo da shell interplanetária.")
        if self.conn:
            self.conn.close()
        return True

    def do_sair(self, arg):
        """Sai da shell"""
        return self._sair()

    def cmdloop(self):
        try:
            super(VueiShell, self).cmdloop()
        except KeyboardInterrupt:  # Ctrl+C
            print("\nSaindo da shell interplanetária (Ctrl+C pressionado).")
            return True

    def default(self, arg):
        if arg == "EOF":  # Ctrl+D
            print()
            return self._sair()
