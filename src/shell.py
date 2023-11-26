import cmd
import webbrowser

from rich import print

from .conn import CantConnectToDbError, get_db_connection


class VueiShell(cmd.Cmd):
    prompt = ">=- "

    def __init__(self):
        super(VueiShell, self).__init__()
        try:
            self.conn = get_db_connection()
        except CantConnectToDbError:
            exit(1)

        # TODO: Rodar o sql para popular o banco de dados

        print("Bem-vindo ao [bold]VUEI DEMAIS[/bold]!")
        print("Digite help ou ? para listar os comandos ou Ctrl+C para sair.")

    def do_listar_expedicoes(self, arg):
        """Lista expedições disponíveis para reserva."""
        print("Expedições disponíveis: Fim do Mundo, Marte, Lua")

    def do_listar_turistas(self, arg):
        """Lista todos os turistas."""
        print("Turistas: João, Maria, José")

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
        if arg == "EOF":
            print()
            return self._sair()
