try:
    from src.shell import VueiShell
except ModuleNotFoundError as e:
    print(f'A biblioteca "{e.name}" não foi encontrada.')
    print("Você criou o virtualenv e instalou as dependências?")
    exit(1)

if __name__ == "__main__":
    VueiShell().cmdloop()
