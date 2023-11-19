import json
import os

import psycopg2
import questionary
from rich import print

DB_ENV_PATH = "connection.json"


class CantConnectToDbError(Exception):
    pass


def health_check(db_config: dict) -> bool:
    """Check if database connection is successful."""
    try:
        conn = psycopg2.connect(**db_config)
        conn.close()
        return True
    except psycopg2.OperationalError:
        return False


def ask_credentials() -> bool:
    """Ask for database credentials. Return True if connection is successful."""

    print(f"[bold green]Configurando o arquivo {DB_ENV_PATH}...\n")

    db_config = {
        "dbname": questionary.text("Nome do banco de dados:").unsafe_ask(),
        "user": questionary.text("Nome do usuário do banco de dados:").unsafe_ask(),
        "password": questionary.password("Senha do banco de dados:").unsafe_ask(),
        "host": questionary.text("Nome do servidor:").unsafe_ask(),
    }

    print()

    with open(DB_ENV_PATH, "w") as file:
        json.dump(db_config, file, indent=2)

    return db_config


def get_credentials() -> dict:
    """Read database credentials from a json file."""
    with open(DB_ENV_PATH, "r") as file:
        return json.load(file)


def get_db_connection():
    if not os.path.exists(DB_ENV_PATH):
        db_config = ask_credentials()
    else:
        db_config = get_credentials()

    while True:
        if health_check(db_config):
            return psycopg2.connect(**db_config)

        print(
            f"[bold red]Suas credenciais ({DB_ENV_PATH}) estão incorretas ou o banco de dados não está disponível.\n"
        )

        SIM = "Sim"
        NAO = f"Não, vou conferir o arquivo antes."

        try:
            choice = questionary.select(
                f"Deseja tentar configurar a conexão novamente?",
                choices=[SIM, NAO],
                instruction="(↑↓)",
                pointer="❯",
            ).unsafe_ask()
            if choice == NAO:
                raise CantConnectToDbError
            else:
                print()
                db_config = ask_credentials()
        except KeyboardInterrupt:
            raise CantConnectToDbError
