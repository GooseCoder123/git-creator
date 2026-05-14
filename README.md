# gitc – Git Repository Creator

A streamlined, interactive command-line tool for quickly scaffolding new Git repositories with GitHub integration. **gitc** handles repository creation, initialization, and project setup in minutes with an intuitive TUI.

## Features

✨ **Interactive Setup** – Guided prompts using [Gum](https://github.com/charmbracelet/gum) for an elegant terminal experience  
🚀 **One-Command Initialization** – Create repos, initialize projects, and push to GitHub in seconds  
📦 **Project Presets** – Ready-to-go templates for Python, Web, and custom projects  
🔐 **Flexible Visibility** – Choose between public and private repositories  
🧹 **Smart .gitignore** – Automatically generates appropriate ignore files based on your project type  
🔑 **GitHub Integration** – Seamless authentication and repository management via GitHub CLI

## Prerequisites

Before using **gitc**, ensure you have the following installed:

- **[GitHub CLI](https://cli.github.com/)** – For repository and authentication management
- **[Gum](https://github.com/charmbracelet/gum)** – For interactive prompts and text input
- **Git** – For version control operations
- **Python 3** (optional) – Only needed if using the Python preset
- **Bash** – The script runs on Bash 4.0+

### Quick Installation

**macOS (Homebrew):**
```bash
brew install gh gum
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install gh gum
```

**Other platforms:** See [GitHub CLI](https://cli.github.com/) and [Gum](https://github.com/charmbracelet/gum) installation guides.

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/GooseCoder123/gitc.git
cd gitc
```

### 2. Make the Script Executable

```bash
chmod +x tui.sh
```

### 3. Authenticate with GitHub

```bash
gh auth login
```

Follow the prompts to authenticate your GitHub account.

## Usage

### Run the Script

```bash
./tui.sh
```
## Project Structures

### Python Preset
```
project-name/
├── .venv/          # Virtual environment
├── src/
│   └── main.py     # Entry point
├── .gitignore      # Python-specific ignores
└── README.md       # Project documentation
```

### Web Preset
```
project-name/
├── src/
│   ├── index.html  # HTML template
│   ├── style.css   # Styling
│   └── script.js   # JavaScript
├── .gitignore      # Node.js/web ignores
└── README.md       # Project documentation
```

### Clear Preset
```
project-name/
├── src/            # Empty source folder
├── .gitignore
└── README.md
```

### Clear (without src) Preset
```
project-name/
├── .gitignore
└── README.md
```

## Troubleshooting

**Error: `gh: command not found`**  
Install GitHub CLI: https://cli.github.com/

**Error: `gum: command not found`**  
Install Gum: https://github.com/charmbracelet/gum

**Error: Authentication failed**  
Run `gh auth login` to re-authenticate with GitHub.

**Repository already exists**  
If a local repo with the same name exists on GitHub, the script skips creation and proceeds with local setup.

## License

This project is open source and available under the MIT License.

## Support

If you encounter issues or have suggestions, please [open an issue](https://github.com/GooseCoder123/gitc/issues) on the GitHub repository.

---

**Made with ❤️ by [GooseCoder123](https://github.com/GooseCoder123)**
