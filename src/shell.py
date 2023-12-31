import cmd
import os

import psycopg2
import questionary
from rich import print
from rich.console import Console

from .conn import CantConnectToDbError, get_db_connection
from .utils import query_to_rich_table, rr

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
        print("Visite o projeto no GitHub: https://www.github.com/diksown/vuei")

    def _is_initialized(self):
        self.cur.execute(
            "SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'guerra')"
        )
        return self.cur.fetchone()[0]

    def _populate_db(self):
        print("[bold green]Populando o banco de dados...[/bold green]")
        file_names = ["esquema.sql", "dados.sql"]
        for file_name in file_names:
            print(f"[bold green]Executando {file_name}...[/bold green]")
            file_path = os.path.join(os.path.dirname(__file__), f"../sql/{file_name}")
            with open(file_path, "r") as file:
                self.cur.execute(file.read())
        print("[bold green]Banco de dados populado com sucesso![/bold green]")
        print()
        self.conn.commit()

    def pretty_query(self, query: str):
        table = query_to_rich_table(self.cur, query)
        return table

    def do_resetar_banco(self, arg):
        """Reseta o banco de dados INTEIRO e popula com os dados iniciais. Use com cuidado!"""
        print(
            "[bold red]Deseja apagar esse banco de dados INTEIRO e preencher com os dados iniciais?[/bold red]",
            end=" ",
        )
        input("Pressione Ctrl+C para cancelar ou Enter para continuar. ")
        print(
            "[bold red]Tem CERTEZA de que quer apagar o banco INTEIRO? Essa operação não tem volta.[bold red]",
            end=" ",
        )
        input("Pressione Enter de novo para confirmar. ")
        self.cur.execute("DROP SCHEMA public CASCADE; CREATE SCHEMA public;")
        self.conn.commit()
        print("[bold green]Banco de dados apagado com sucesso![/bold green]")
        self._populate_db()

    def do_listar_expedicoes(self, arg):
        """Lista expedições que ainda não partiram
        e que possuem vagas. (1º do consultas.sql)"""
        try:
            table = self.pretty_query(
                """
                SELECT 
                    EX.ROTA,
                    EX.NAVE,
                    EX.DH_INICIO,
                    ((NV.CAPACIDADE - 1) - COUNT(ET.TURISTA))
                    AS VAGAS_RESTANTES
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
                    ON TURISTA.EMAIL = PESSOA.EMAIL
                ORDER BY NOME;
                """
            )
            console.print(table)
        except Exception as e:
            print(e)

    def do_inserir_turista_em_expedicao(self, arg):
        """Insere um turista em uma expedição."""
        try:
            turista = questionary.text("Email do turista:").unsafe_ask()
            nave = questionary.text("Número de registro da nave:").unsafe_ask()
            dh_inicio = questionary.text(
                'Data e hora de início da expedição (formato "YYYY-MM-DD HH24:MI:SS"):'
            ).unsafe_ask()
        except KeyboardInterrupt:
            return

        data = rr(nave, dh_inicio, turista)

        try:
            self.cur.execute(
                """
                INSERT INTO EXPEDICAO_TURISTA (NAVE, DH_INICIO, TURISTA)
                VALUES (%s, %s, %s)
                """,
                data,
            )
            self.conn.commit()
            print(
                f"[bold green]Turista {turista} registrado na expedição "
                + "(NAVE='{nave}', DH_INICIO='{dh_inicio}').[/bold green]"
            )
        except psycopg2.Error as error:
            a = f"Erro ao inserir turista na expedição: {error}"
            print(a)
            self.conn.rollback()

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
        else:
            return super(VueiShell, self).default(arg)
