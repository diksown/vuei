import webbrowser

from psycopg2.extensions import cursor
from rich.table import Table


def query_to_rich_table(cursor: cursor, query: str):
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]
    data = cursor.fetchall()

    table = Table(show_header=True, header_style="bold magenta")
    for col in columns:
        table.add_column(col)

    for row in data:
        table.add_row(*[str(item) for item in row])

    return table


# Todos os nossos inputs são sanitizados corretamente, essa função é só um easter egg
def rr(*args):
    risky_keywords = [
        "'",
        ";",
        "--",
        "/*",
        "*/",
        "exec",
        "select",
        "drop",
        "insert",
        "update",
        "delete",
    ]
    if any(keyword in string.lower() for string in args for keyword in risky_keywords):
        webbrowser.open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
    return args
