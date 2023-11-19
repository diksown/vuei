import cmd

import psycopg2


class VueiShell(cmd.Cmd):
    intro = "Bem-vindo ao VUEI DEMAIS!\nDigite help ou ? para listar os comandos ou Ctrl+C para sair."
    prompt = ">=- "

    def __init__(self):
        super(VueiShell, self).__init__()
        self.conn = None
        self.connect_db()

    def connect_db(self):
        try:
            self.conn = psycopg2.connect(
                dbname="vuei",
                user="postgres",
                password="postgres",
                host="localhost",
            )
            print("Conexão com o banco de dados estabelecida.")
        except Exception as e:
            print("Não foi possível conectar ao banco de dados:", e)
            exit(1)

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
