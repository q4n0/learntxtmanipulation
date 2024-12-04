import re
import os
import subprocess
from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt
from rich.markdown import Markdown

class TextProcessingLearningTool:
    def __init__(self):
        """Initialize the text processing learning environment."""
        self.console = Console()
        # Predefined learning resources
        self.learning_resources = {
            "regex": """
# Regular Expression (Regex) Learning Guide

Regular expressions are powerful patterns used to search and manipulate text:
- `.` matches any single character
- `*` means zero or more of the previous character
- `+` means one or more of the previous character
- `\d` matches any digit
- `\w` matches any word character (letters, digits, underscore)

Examples:
- `\d+` matches one or more digits
- `\w+@\w+\.\w+` matches simple email patterns
""",
            "grep": """
# Grep (Global Regular Expression Print) Guide

Grep is a command-line tool for searching text:
- Searches files for specific patterns
- Can use regular expressions
- Useful for finding information quickly

Common use cases:
- Finding lines containing specific words
- Searching log files
- Extracting information from large text files
""",
            "awk": """
# Awk Text Processing Guide

Awk is a powerful text-processing tool:
- Can process text files line by line
- Allows complex text manipulation
- Great for data extraction and reporting

Basic syntax:
- `awk '{print $1}'` prints the first column of text
- `awk -F, '{print $2}'` prints second column using comma as separator
""",
            "sed": """
# Sed (Stream Editor) Guide

Sed is used for parsing and transforming text:
- Can substitute text
- Modify files without opening them
- Perform quick text replacements

Common operations:
- `s/old/new/` replaces first occurrence
- `s/old/new/g` replaces all occurrences
"""
        }

    def show_learning_resource(self, topic):
        """Display learning resource for a specific topic."""
        resource = self.learning_resources.get(topic, "No resource found.")
        self.console.print(Panel(
            Markdown(resource), 
            title=f"[bold cyan]{topic.upper()} Learning Resource[/bold cyan]"
        ))

    def safe_execute_command(self, command):
        """
        Safely execute shell commands with error handling.
        Limits command complexity to prevent potential misuse.
        """
        try:
            # Prevent complex shell injection by limiting command complexity
            if len(command) > 200 or ';' in command or '|' in command:
                return "", "Command too complex or potentially unsafe"
            
            result = subprocess.run(
                command, 
                shell=True, 
                text=True, 
                capture_output=True, 
                timeout=10  # Prevent long-running commands
            )
            return result.stdout, result.stderr
        except subprocess.TimeoutExpired:
            return "", "Command took too long to execute"
        except Exception as e:
            return "", str(e)

    def regex_playground(self):
        """Interactive Regex Learning Environment."""
        self.show_learning_resource("regex")
        
        # Provide a more comprehensive sample text
        sample_texts = [
            "Emails: alice@example.com, bob123@gmail.com, charlie.brown@company.co.uk",
            "Phone numbers: (555) 123-4567, +1-800-555-1234, 123.456.7890",
            "Dates: 2023-12-31, 01/15/2024, 15-Apr-2022"
        ]

        while True:
            self.console.print("\n[bold]Sample Texts:[/bold]")
            for i, text in enumerate(sample_texts, 1):
                self.console.print(f"{i}. [green]{text}[/green]")
            
            text_choice = Prompt.ask("Choose a sample text (number) or 'exit'", default="1")
            
            if text_choice.lower() == 'exit':
                break
            
            try:
                sample_text = sample_texts[int(text_choice) - 1]
            except (ValueError, IndexError):
                sample_text = sample_texts[0]
            
            pattern = Prompt.ask("Enter a regex pattern to match")
            
            try:
                matches = re.findall(pattern, sample_text)
                
                if matches:
                    self.console.print(f"[bold]Matches found:[/bold] [yellow]{matches}[/yellow]")
                    self.console.print(f"[bold]Number of matches:[/bold] [green]{len(matches)}[/green]")
                else:
                    self.console.print("[red]No matches found. Try a different pattern![/red]")
                
            except re.error as e:
                self.console.print(f"[red]Invalid regex pattern: {e}[/red]")
                self.console.print("Tip: Check your pattern syntax!")

    def file_search_tool(self):
        """
        Enhanced file search tool with learning components
        Combines grep-like functionality with educational guidance
        """
        self.show_learning_resource("grep")
        
        while True:
            file_path = Prompt.ask("Enter file path to search (or 'exit' to return)")
            
            if file_path.lower() == 'exit':
                break
            
            if not os.path.exists(file_path):
                self.console.print("[red]File not found. Check the path and try again.[/red]")
                continue
            
            search_type = Prompt.ask(
                "Search by:\n1. Keyword\n2. Regex Pattern\n3. Line Number Range", 
                default="1"
            )
            
            if search_type == "1":
                keyword = Prompt.ask("Enter keyword to search")
                command = f"grep -n '{keyword}' '{file_path}'"
            elif search_type == "2":
                pattern = Prompt.ask("Enter regex pattern")
                command = f"grep -nE '{pattern}' '{file_path}'"
            elif search_type == "3":
                start = Prompt.ask("Start line number", default="1")
                end = Prompt.ask("End line number", default="10")
                command = f"sed -n '{start},{end}p' '{file_path}'"
            else:
                self.console.print("[red]Invalid choice![/red]")
                continue
            
            output, error = self.safe_execute_command(command)
            
            if error:
                self.console.print(f"[red]Error: {error}[/red]")
            elif output:
                self.console.print("[green]Search Results:[/green]")
                self.console.print(output)
            else:
                self.console.print("[yellow]No results found.[/yellow]")

    def main_menu(self):
        """Enhanced main menu with clear guidance."""
        while True:
            self.console.print(Panel(
                "[bold cyan]Text Processing Learning Tool[/bold cyan]\n"
                "Explore powerful text manipulation techniques!\n\n"
                "1. Regex Playground\n"
                "2. File Search & Learning\n"
                "3. Learn More\n"
                "4. Exit",
                title="[bold green]Main Menu[/bold green]"
            ))

            choice = Prompt.ask("Select an option", default="1")

            if choice == "1":
                self.regex_playground()
            elif choice == "2":
                self.file_search_tool()
            elif choice == "3":
                self.show_all_learning_resources()
            elif choice == "4":
                self.console.print("[green]Thank you for learning! Goodbye![/green]")
                break
            else:
                self.console.print("[red]Invalid choice. Try again![/red]")

    def show_all_learning_resources(self):
        """Display all learning resources."""
        for topic in self.learning_resources:
            self.show_learning_resource(topic)
        
        self.console.print("\n[bold]Recommended Next Steps:[/bold]")
        self.console.print("1. Practice each technique")
        self.console.print("2. Experiment with different patterns")
        self.console.print("3. Create your own text processing challenges")

def main():
    tool = TextProcessingLearningTool()
    tool.main_menu()

if __name__ == "__main__":
    main()
