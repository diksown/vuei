import os

import psycopg2
import toml
from rich.prompt import Prompt

DB_ENV_PATH = "settings.toml"


def create_db_env(file_path):
    """Create a file with database configurations using prompts."""
    print(f"Vamos configurar o arquivo {DB_ENV_PATH}.")
    db_config = {
        "dbname": Prompt.ask("Nome do banco de dados", default="vuei"),
        "user": Prompt.ask("Nome do usuário do banco de dados", default="postgres"),
        "password": Prompt.ask(
            "Senha do banco de dados", password=True, default="postgres"
        ),
        "host": Prompt.ask("Nome do servidor", default="localhost"),
    }

    with open(file_path, "w") as file:
        toml.dump(db_config, file)

    return db_config


def read_db_env(file_path):
    """Read database configuration from a TOML file."""
    with open(file_path, "r") as file:
        return toml.load(file)


def handle_db_connection():
    if not os.path.exists(DB_ENV_PATH):
        db_config = create_db_env(DB_ENV_PATH)
    else:
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
    except psycopg2.OperationalError as e:
        print("Não foi possível estabelecer uma conexão com o banco de dados.")
        print(f"Verifique as configurações no arquivo {DB_ENV_PATH} e tente novamente.")
        print(f"Erro: {e}")
        return None
