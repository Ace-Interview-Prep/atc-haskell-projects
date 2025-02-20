# Project 1: Todo List Manager

## How to Run the Application

Install Nix if you haven't already. Follow the instructions at https://nixos.org/download.html.

You'll need to ensure your Github is properly set up for SSH. Follow the instructions at https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent 

Load the Nix environment by navigating to the project folder and running in your terminal:

```bash
# If you haven't already 
git clone git@github.com:Ace-Interview-Prep/atc-haskell-projects.git
cd atc-haskell-projects
git switch 1-todo-manager

nix-shell
```

This will load your development environment with all the necessary Haskell dependencies.

Build the project using cabal:

```bash
cabal build
```

Run the application:

```bash
cabal run
```

Test the CLI by typing in commands and interacting with the recursive prompt.

## Software Requirements

### Basic Functionality:
- Users can add a new task to the to-do list.
- Users can view all tasks in the to-do list.
- Users can mark a task as completed.
- Users can delete a task from the list.
- Users can edit a task’s description.
- Tasks should be stored persistently (e.g., in a text file).

### Advanced Features (Optional):
- Allow users to prioritize tasks (e.g., High, Medium, Low).
- Implement due dates for tasks and sort tasks by due date.
- Filter tasks by their completion status (e.g., show only incomplete tasks).
- Provide command-line options to manage tasks without entering an interactive mode (e.g., `todo add "Buy groceries"`).

### User Interface:
- A simple and intuitive command-line interface.
- Display a help menu when requested (`--help` or `-h`), listing all available commands.

### Error Handling:
- The application should handle errors gracefully, providing user-friendly messages (e.g., when trying to mark a non-existent task as complete).

### Code Structure:
- The code should be modular, separating concerns (e.g., task management, file handling, user interaction).
- Follow best practices for Haskell, including proper use of types, functions, and purity where applicable.

## Acceptance Criteria:
- **Task Management:**
  - The user can successfully add a new task, view it, mark it as complete, edit it, and delete it.
  - Tasks persist between sessions (i.e., closing and reopening the application should not lose data).

- **Advanced Features (if implemented):**
  - Tasks can be prioritized, and the list can be filtered or sorted as per user input.
  - Tasks with due dates are sorted correctly when the user requests it.

- **User Interface:**
  - The help menu is clear and correctly displays all available commands.
  - Commands are intuitive and easy to use.

- **Error Handling:**
  - The application should not crash or behave unexpectedly when given invalid input (e.g., marking a non-existent task as complete).

- **Code Quality:**
  - The code should be clean, well-documented, and follow Haskell best practices.
  - Modular design should be evident, with distinct functions and types handling different aspects of the application.

## Rubric:

### Scoring System
Each criterion is evaluated based on three categories:

- **Completion (30%):** The feature is fully implemented, with edge cases considered.
- **Quality (20%):** The code is well-structured, follows best practices, and is not copy-pasted.
- **Understanding (50%):** The student can clearly explain their implementation and reasoning.

If a student scores 0 in Understanding for a criterion, the maximum they can receive for that criterion is 30% of the available points.

---

| Category                  | Criteria                                   | Completion (30%) | Quality (20%) | Understanding (50%) | Final Score |
|---------------------------|--------------------------------------------|-----------------|---------------|---------------------|-------------|
| **Basic Functionality**   |                                            |                 |               |                     |             |
|                           | Adding a task                              |                 |               |                     |             |
|                           | Viewing tasks                              |                 |               |                     |             |
|                           | Marking a task as complete                 |                 |               |                     |             |
|                           | Deleting a task                            |                 |               |                     |             |
|                           | Editing a task                             |                 |               |                     |             |
| **Advanced Features**     | (Optional)                                 |                 |               |                     |             |
|                           | Task prioritization                        |                 |               |                     |             |
|                           | Due dates and sorting                      |                 |               |                     |             |
|                           | Filtering tasks by status                  |                 |               |                     |             |
|                           | Command-line options for non-interactive mode |              |               |                     |             |
| **User Interface**        |                                            |                 |               |                     |             |
|                           | Help menu                                  |                 |               |                     |             |
|                           | Overall usability and intuitiveness        |                 |               |                     |             |
| **Error Handling**        |                                            |                 |               |                     |             |
|                           | Graceful handling of invalid input         |                 |               |                     |             |
|                           | User-friendly error messages               |                 |               |                     |             |
| **Code Quality**          |                                            |                 |               |                     |             |
|                           | Modular design                             |                 |               |                     |             |
|                           | Code cleanliness and readability           |                 |               |                     |             |
|                           | Use of Haskell best practices              |                 |               |                     |             |
| **Total**                 | *(100 points if advanced features are not implemented, 120 if they are)* |     |    |              |             |
