import os

import psycopg2
import questionary
import toml
from rich.prompt import Prompt
from rich.text import Text


class PromptWithDefault(Prompt):
    def render_default(self, default) -> Text:
        return Text(f"(default = {default})", "prompt.default")


class CantConnectToDbError(Exception):
    pass


DB_ENV_PATH = "settings.toml"


def create_db_env(file_path):
    """Create a file with database configurations using prompts."""
    print(f"Vamos configurar o arquivo {DB_ENV_PATH}.")
    db_config = {
        "dbname": PromptWithDefault.ask("Nome do banco de dados", default="vuei"),
        "user": PromptWithDefault.ask(
            "Nome do usuário do banco de dados", default="postgres"
        ),
        "password": PromptWithDefault.ask(
            "Senha do banco de dados", password=True, default="postgres"
        ),
        "host": PromptWithDefault.ask("Nome do servidor", default="localhost"),
    }

    with open(file_path, "w") as file:
        toml.dump(db_config, file)

    return db_config


def read_db_env(file_path):
    """Read database configuration from a TOML file."""
    with open(file_path, "r") as file:
        return toml.load(file)


def handle_db_connection():
    """Handle database connection."""
    if not os.path.exists(DB_ENV_PATH):
        db_config = create_db_env(DB_ENV_PATH)
    else:
        print(f"Arquivo {DB_ENV_PATH} encontrado. Lendo configurações...")
        db_config = read_db_env(DB_ENV_PATH)

    try:
        conn = psycopg2.connect(
            dbname=db_config.get("dbname"),
            user=db_config.get("user"),
            password=db_config.get("password"),
            host=db_config.get("host"),
        )
        print("Conexão com o banco de dados estabelecida com sucesso.")
        return conn

    except psycopg2.OperationalError:
        print()
        print(f"Não foi possível conectar usando o arquivo {DB_ENV_PATH}.")
        print(f"1. Os dados de conexão estão incorretos.")
        print(f"2. Esse banco de dados não existe ou não está disponível no momento.")
        print()
        print("Confira o arquivo settings.toml e tente novamente.")
        # q = questionary.select(
        #     "O que você deseja fazer?",
        #     choices=["Mostrar a configuração", "Fazer a configuração novamente"],
        #     instruction="(↑ ↓)",
        #     pointer="❯",
        # ).ask()
        # print(f"q is {q}")
        raise CantConnectToDbError
