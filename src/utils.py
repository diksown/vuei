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
        print(row)
        table.add_row(*[str(item) for item in row])

    return table
