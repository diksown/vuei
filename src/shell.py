import cmd

from .database import handle_db_connection


class VueiShell(cmd.Cmd):
    intro = "Bem-vindo ao VUEI DEMAIS!\nDigite help ou ? para listar os comandos ou Ctrl+C para sair."
    prompt = ">=- "

    def __init__(self):
        super(VueiShell, self).__init__()
        self.conn = handle_db_connection()

    def do_consultar_destinos(self, arg):
        """Consulta destinos de expedições interplanetárias."""
        print("Destinos disponíveis: Marte, Júpiter, Saturno")

    def do_verificar_nave(self, arg):
        """Verifica o status da nave espacial."""
        print("Status da Nave: Pronta para decolagem")

    def do_registrar_expedicao(self, arg):
        """Registra uma nova expedição."""
        print("Expedição registrada com sucesso!")

    def do_sair(self, arg):
        """Sai da shell interplanetária."""
        print("Saindo da shell interplanetária.")
        if self.conn:
            self.conn.close()
        return True

    def cmdloop(self):
        try:
            super(VueiShell, self).cmdloop()
        except KeyboardInterrupt:  # Ctrl+C
            print("\nSaindo da shell interplanetária (Ctrl+C pressionado).")
            return True
