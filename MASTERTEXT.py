import re
import os
import subprocess
from rich.console import Console
from rich.table import Table
from rich.prompt import Prompt
from rich.panel import Panel
from rich.progress import Progress

console = Console()

def execute_command(command):
    """Executes a shell command and returns the output."""
    try:
        result = subprocess.run(command, shell=True, text=True, capture_output=True)
        return result.stdout, result.stderr
    except Exception as e:
        return "", str(e)

def show_table(data, headers):
    """Displays data in a tabular format."""
    table = Table(show_header=True, header_style="bold magenta")
    for header in headers:
        table.add_column(header)
    for row in data:
        table.add_row(*row)
    console.print(table)

def regex_exercise():
    """Interactive Regex Playground."""
    console.print(Panel("[bold cyan]Regex Playground[/bold cyan]"))
    sample_text = """Hello, this is a test. Emails: test@example.com, user@mail.com. Numbers: 12345, 67890."""
    console.print(f"Sample text: [green]{sample_text}[/green]")

    while True:
        pattern = Prompt.ask("Enter a regex pattern (or 'exit' to return)")
        if pattern.lower() == 'exit':
            break

        try:
            matches = re.findall(pattern, sample_text)
            console.print(f"Matches: [yellow]{matches}[/yellow]")
        except re.error as e:
            console.print(f"[red]Invalid regex pattern: {e}[/red]")

def grep_tool():
    """Interactive grep tool."""
    console.print(Panel("[bold cyan]Grep Tool[/bold cyan]"))
    file_path = Prompt.ask("Enter the path to a file")

    if not os.path.exists(file_path):
        console.print("[red]File not found![/red]")
        return

    while True:
        keyword = Prompt.ask("Enter a keyword to search (or 'exit' to return)")
        if keyword.lower() == 'exit':
            break

        command = f"grep '{keyword}' {file_path}"
        output, error = execute_command(command)
        if error:
            console.print(f"[red]{error}[/red]")
        else:
            console.print(f"[green]{output}[/green]")

def awk_tool():
    """Interactive awk tool."""
    console.print(Panel("[bold cyan]Awk Tool[/bold cyan]"))
    file_path = Prompt.ask("Enter the path to a file")

    if not os.path.exists(file_path):
        console.print("[red]File not found![/red]")
        return

    while True:
        pattern = Prompt.ask("Enter an awk pattern (or 'exit' to return)")
        if pattern.lower() == 'exit':
            break

        command = f"awk '{pattern}' {file_path}"
        output, error = execute_command(command)
        if error:
            console.print(f"[red]{error}[/red]")
        else:
            console.print(f"[green]{output}[/green]")

def sed_tool():
    """Interactive sed tool."""
    console.print(Panel("[bold cyan]Sed Tool[/bold cyan]"))
    file_path = Prompt.ask("Enter the path to a file")

    if not os.path.exists(file_path):
        console.print("[red]File not found![/red]")
        return

    while True:
        expression = Prompt.ask("Enter a sed expression (or 'exit' to return)")
        if expression.lower() == 'exit':
            break

        command = f"sed '{expression}' {file_path}"
        output, error = execute_command(command)
        if error:
            console.print(f"[red]{error}[/red]")
        else:
            console.print(f"[green]{output}[/green]")

def ethical_hacking():
    """Ethical hacking use cases."""
    console.print(Panel("[bold cyan]Ethical Hacking Use Cases[/bold cyan]"))
    use_cases = {
        "1": "Extract email addresses from a file",
        "2": "Find all IP addresses in a file",
        "3": "Scan a file for open ports",
    }

    for key, value in use_cases.items():
        console.print(f"[bold cyan]{key}[/bold cyan]: {value}")

    choice = Prompt.ask("Select a use case")

    if choice == "1":
        file_path = Prompt.ask("Enter the path to a file")
        command = f"grep -Eo '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{{2,}}' {file_path}"
    elif choice == "2":
        file_path = Prompt.ask("Enter the path to a file")
        command = f"grep -Eo '([0-9]{{1,3}}\\.){{3}}[0-9]{{1,3}}' {file_path}"
    elif choice == "3":
        file_path = Prompt.ask("Enter the path to a file")
        command = f"grep -Eo 'port [0-9]+' {file_path}"
    else:
        console.print("[red]Invalid choice![/red]")
        return

    output, error = execute_command(command)
    if error:
        console.print(f"[red]{error}[/red]")
    else:
        console.print(f"[green]{output}[/green]")

def main_menu():
    """Main interactive menu."""
    while True:
        console.print(Panel("[bold cyan]Interactive CLI Tool[/bold cyan]"))
        options = {
            "1": "Regex Playground",
            "2": "Grep Tool",
            "3": "Awk Tool",
            "4": "Sed Tool",
            "5": "Ethical Hacking Use Cases",
            "6": "Exit",
        }

        for key, value in options.items():
            console.print(f"[bold cyan]{key}[/bold cyan]: {value}")

        choice = Prompt.ask("Select an option")

        if choice == "1":
            regex_exercise()
        elif choice == "2":
            grep_tool()
        elif choice == "3":
            awk_tool()
        elif choice == "4":
            sed_tool()
        elif choice == "5":
            ethical_hacking()
        elif choice == "6":
            console.print("[green]Goodbye![/green]")
            break
        else:
            console.print("[red]Invalid choice![/red]")

if __name__ == "__main__":
    main_menu()
