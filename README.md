# 🎨 Modern Dark Pro Zsh Themes

A suite of premium, modern, and dark-mode-optimized Oh My Zsh themes inspired by the [Modern Dark Pro](https://github.com/dvigo/modern-dark-pro) color palettes. 

This repository provides **two first-class theme layouts** designed for developers who appreciate clean typography, high readability, and fast execution times:

- **Classic Theme (`modern-dark-pro`)**: A clean, two-line layout with subtle guide lines (`┌─` and `└─`) connecting your command output steps.
- **Capsule Theme (`modern-dark-pro-capsule`)**: A modern, bubble-style layout that wraps your terminal state segments (directory, git branch, changes) in sleek capsule containers.

---

## 📸 Previews

### 1. Classic Theme (`modern-dark-pro`)
![Classic Theme Preview](preview.png)

### 2. Capsule Theme (`modern-dark-pro-capsule`)
![Capsule Theme Preview](preview-capsule.png)

---

## ✨ Features (Shared by Both Themes)

- **🚀 Dual Variant Support**: Switch between **Night** (pastel tones, soft black) and **Monokai** (vibrant classic Monokai, warm black) to match your editor theme.
- **📁 Smart Path Display**: Shows the working directory cleanly with rich color contrast.
- **🎋 Complete Git Status**:
  - Displays branch name.
  - Interactive status badges: Modified, Staged, Untracked, Stashed. Separated with generous spacing for maximum legibility.
  - Sync status with remote: Ahead and Behind indicators.
- **⏱️ Execution Timer**: Tracks command duration and prints it (e.g., ` 2.5s`) if it takes longer than 2 seconds (configurable).
- **🕒 System Clock**: Displays the current system time (`HH:MM:SS`) aligned perfectly and out of the way.
- **🐍 Python virtualenv / Conda**: Displays active virtual environments with a custom logo (``).
- **🔒 Read-only Lock**: Displays a lock icon (``) if you navigate into a folder where you don't have write permissions.
- **⚙️ Background Jobs**: Displays a gear icon (`⚙`) followed by the count of running background jobs in your session.
- ** SSH Indicator**: Displays ` username@host` if you are logged in over SSH, keeping you aware of remote sessions.
- **🟢 Status Feedback**: The prompt symbol (`❯`) turns green on success and red on failure to indicate the command's exit code.
- **⚡ Super Lightweight**: Highly optimized Git status parsing and shell hook code to prevent terminal latency.

---

## 📦 Installation

### Prerequisites
- **Oh My Zsh** must be installed. If not, install it via:
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

### Step 1: Clone the repository
Clone this project into a local folder:
```bash
git clone https://github.com/dvigo/modern-dark-pro-ohmyzsh.git ~/dev/modern-dark-pro-ohmyzsh
```

### Step 2: Run the installer
Run the provided installer script, which creates symlinks for **both themes** in your Oh My Zsh custom themes folder:
```bash
cd ~/dev/modern-dark-pro-ohmyzsh
./install.sh
```

### Step 3: Configure your `~/.zshrc`
Open your `~/.zshrc` and change the `ZSH_THEME` setting to select your preferred style:

* **To use the Classic Theme:**
  ```bash
  ZSH_THEME="modern-dark-pro"
  ```

* **To use the Capsule Theme:**
  ```bash
  ZSH_THEME="modern-dark-pro-capsule"
  ```

Reload your terminal:
```bash
source ~/.zshrc
```

---

## ⚙️ Customization & Configuration

You can customize the theme behavior by exporting variables in your `~/.zshrc` file **before** the line where Oh My Zsh is sourced (`source $ZSH/oh-my-zsh.sh`).

### 1. Theme Variant
Choose between the two color variants (applies to both themes):
```bash
# Options: "night" (default) or "monokai"
export MODERN_DARK_PRO_VARIANT="night"
```

### 2. Developer Icons (Nerd Fonts)
The classic theme defaults to using standard Unicode symbols so that it works out of the box on all systems without any rendering issues. The capsule theme defaults to `true` to display icons out of the box. You can manually configure this setting:
```bash
# Enable Nerd Fonts (default: false for classic, true for capsule)
export MODERN_DARK_PRO_NERD_FONTS=true
```

| Indicator | Nerd Fonts Icon (if enabled) | Standard Unicode (Default) |
| :--- | :--- | :--- |
| **Directory** | `` | `📁` |
| **Git Branch** | `` | `⌥` |
| **Command Timer / Clock** | `` | `🕒` |
| **Modified / Dirty** | `` | `✗` |
| **Staged** | `` | `●` |
| **Untracked** | `` | `?` |
| **Stashed** | `` | `⚑` |
| **Ahead** | `` | `⇡` |
| **Behind** | `` | `⇣` |
| **Python environment** | `` | `py` |
| **Node.js version** | `` | `node` |
| **Golang version** | `` | `go` |
| **Rust version** | `` | `rust` |
| **Terraform workspace** | `󱁢` | `tf` |
| **Kubernetes Context** | `☸` | `k8s` |
| **AWS Profile** | `` | `aws` |
| **Read-Only Lock** | `` | `🔒` |
| **SSH Host** | `` | `ssh` |
| **Background Jobs** | `` | `⚙` |

### 🖼️ Visual Symbols Legend
If you don't have a Nerd Font installed locally on your browser or editor, here is how the icons look:

![Modern Dark Pro Symbols Legend](symbols.png)

### 3. Capsule Settings (Capsule Theme Only)
If you are using the `modern-dark-pro-capsule` theme, you can configure these exclusive settings:

#### Container Style (`MODERN_DARK_PRO_PILL_STYLE`)
Choose how your capsule segments are wrapped:
- `bracket` (default): Outlines each segment in thin bordered brackets, e.g. `[ 📁 path ]`.
- `round`: Renders solid-background capsules with Powerline rounded caps (`` and ``).
- `none`: Disables capsules, showing flat text.

```bash
# Options: "bracket" (default), "round", "none"
export MODERN_DARK_PRO_PILL_STYLE="bracket"
```

#### Prompt Layout (`MODERN_DARK_PRO_PROMPT_LAYOUT`)
Choose how the prompt layout is structured:
- `two-line` (default): Capsules and clock on line 1, input prompt character (`❯`) on line 2. Keeps your input space clean and roomy.
- `single`: All capsules and prompt character (`❯`) on a single line.
- `classic`: Wraps segments in capsules but connects them to the prompt character using the classic connecting lines (`┌─` and `└─`).

```bash
# Options: "two-line" (default), "single", "classic"
export MODERN_DARK_PRO_PROMPT_LAYOUT="two-line"
```

#### Clock Toggle (`MODERN_DARK_PRO_SHOW_CLOCK`)
Toggle the right-aligned clock:
```bash
# Options: true (default) or false
export MODERN_DARK_PRO_SHOW_CLOCK=true
```

### 4. Custom Symbols
You can customize the prompt characters or icons manually in your `~/.zshrc`:
```bash
# Custom primary prompt symbol (default: ❯)
export MODERN_DARK_PRO_CHAR="❯"

# Custom Git branch icon (overrides Nerd Font defaults)
export MODERN_DARK_PRO_GIT_SYMBOL=""
```

### 5. Command Timer Options
You can toggle the timer or change the minimum threshold in seconds:
```bash
# Toggle showing command execution duration (default: true)
export MODERN_DARK_PRO_SHOW_EXEC_TIME=true

# Show timer only for commands that take more than X seconds (default: 2)
export MODERN_DARK_PRO_EXEC_TIME_MIN=3
```

### 6. Directory Path Styles
You can customize how the working directory is displayed and shortened in your prompt:
```bash
# Choose path display style: 'shrink' (default for classic, 'limit' for capsule), 'limit', or 'full'
# - 'shrink': Shrinks parent folders to 1 letter, e.g., ~/d/p/modern-dark-pro-ohmyzsh
# - 'limit': Shows only the last N directories, e.g., .../proyectos/modern-dark-pro-ohmyzsh
# - 'full': Shows the full directory path, e.g., ~/dev/proyectos/modern-dark-pro-ohmyzsh
export MODERN_DARK_PRO_PATH_STYLE="shrink"

# Depth level (used only if style is set to 'limit') (default: 3)
export MODERN_DARK_PRO_PATH_DEPTH=3
```

---

## 🎨 Color Palettes

### Night Variant (Default)
Soft, elegant pastel colors optimized for modern OLED and dark displays.
- **Directory**: `#64b5f6` (Light Blue)
- **Git Branch**: `#ba68c8` (Soft Purple) / `#81c784` (Soft Green on Capsule)
- **Success/Staged**: `#81c784` (Soft Green)
- **Warning/Untracked**: `#ffb74d` (Soft Orange)
- **Error/Dirty**: `#e57373` (Soft Red)

### Monokai Variant
The classic high-contrast Monokai theme colors adapted for terminal use.
- **Directory**: `#66d9ef` (Monokai Blue)
- **Git Branch**: `#ae81ff` (Monokai Purple) / `#a6e22e` (Monokai Green on Capsule)
- **Success/Staged**: `#a6e22e` (Monokai Green)
- **Warning/Untracked**: `#e6db74` (Monokai Yellow)
- **Error/Dirty**: `#f92672` (Monokai Red)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
