import cmd

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

    def do_consultar_destinos(self, arg):
        """Consulta destinos de expedições interplanetárias."""
        print("Destinos disponíveis: Marte, Júpiter, Saturno")

    def do_verificar_nave(self, arg):
        """Verifica o status da nave espacial."""
        print("Status da Nave: Pronta para decolagem")

    def do_registrar_expedicao(self, arg):
        """Registra uma nova expedição."""
        print("Expedição registrada com sucesso!")

    def _sair(self):
        print(f"Saindo da shell interplanetária.")
        if self.conn:
            self.conn.close()
        return True

    def do_sair(self, arg):
        """Sai da shell"""
        return self._sair()

    def do_EOF(self, arg):
        """Comando criado para sair da shell com Ctrl+D."""
        print()  # Pula uma linha para ficar consistente com os outros
        return self._sair()

    def cmdloop(self):
        try:
            super(VueiShell, self).cmdloop()
        except KeyboardInterrupt:  # Ctrl+C
            print("\nSaindo da shell interplanetária (Ctrl+C pressionado).")
            return True
