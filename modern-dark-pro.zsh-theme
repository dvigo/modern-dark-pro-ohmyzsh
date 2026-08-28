# ------------------------------------------------------------------------------
# Modern Dark Pro - Oh My Zsh Theme
# A clean, professional, and dark-mode-optimized theme for Zsh.
# Inspired by the Modern Dark Pro VS Code / JetBrains color palettes.
# Repository: https://github.com/dvigo/modern-dark-pro-ohmyzsh
# ------------------------------------------------------------------------------

# Color Palette Configurator
# Detects truecolor support and falls back to standard 256-color codes if not supported.
if [[ "${COLORTERM}" == "truecolor" || "${COLORTERM}" == "24bit" ]]; then
  # TrueColor 24-bit Hex Colors
  if [[ "${MODERN_DARK_PRO_VARIANT}" == "monokai" ]]; then
    COLOR_CONNECTOR="#75715e"  # Gray
    COLOR_PATH="#66d9ef"       # Blue
    COLOR_GIT_BRANCH="#ae81ff" # Purple
    COLOR_SUCCESS="#a6e22e"    # Green
    COLOR_WARNING="#e6db74"    # Yellow
    COLOR_ERROR="#f92672"      # Red
    COLOR_EXEC_TIME="#ae81ff"  # Purple
    COLOR_TEXT="#f8f8f2"       # Foreground
  else
    COLOR_CONNECTOR="#666666"  # Gray
    COLOR_PATH="#64b5f6"       # Blue
    COLOR_GIT_BRANCH="#ba68c8" # Purple
    COLOR_SUCCESS="#81c784"    # Green
    COLOR_WARNING="#ffb74d"    # Orange/Yellow
    COLOR_ERROR="#e57373"      # Red
    COLOR_EXEC_TIME="#ba68c8"  # Purple
    COLOR_TEXT="#e0e0e0"       # Foreground
  fi
else
  # Fallback to standard 256-color codes (widely supported on all terminals)
  if [[ "${MODERN_DARK_PRO_VARIANT}" == "monokai" ]]; then
    COLOR_CONNECTOR="101"
    COLOR_PATH="81"
    COLOR_GIT_BRANCH="141"
    COLOR_SUCCESS="148"
    COLOR_WARNING="185"
    COLOR_ERROR="197"
    COLOR_EXEC_TIME="141"
    COLOR_TEXT="255"
  else
    COLOR_CONNECTOR="242"
    COLOR_PATH="75"
    COLOR_GIT_BRANCH="176"
    COLOR_SUCCESS="114"
    COLOR_WARNING="215"
    COLOR_ERROR="167"
    COLOR_EXEC_TIME="176"
    COLOR_TEXT="254"
  fi
fi

# Configuration Variables with defaults
MODERN_DARK_PRO_CHAR="${MODERN_DARK_PRO_CHAR:-❯}"
MODERN_DARK_PRO_SHOW_EXEC_TIME="${MODERN_DARK_PRO_SHOW_EXEC_TIME:-true}"
MODERN_DARK_PRO_EXEC_TIME_MIN="${MODERN_DARK_PRO_EXEC_TIME_MIN:-2}"
MODERN_DARK_PRO_NERD_FONTS="${MODERN_DARK_PRO_NERD_FONTS:-false}"
MODERN_DARK_PRO_PATH_STYLE="${MODERN_DARK_PRO_PATH_STYLE:-shrink}"
MODERN_DARK_PRO_PATH_DEPTH="${MODERN_DARK_PRO_PATH_DEPTH:-3}"
MODERN_DARK_PRO_CLICKABLE_PATH="${MODERN_DARK_PRO_CLICKABLE_PATH:-true}"
MODERN_DARK_PRO_CLICKABLE_GIT="${MODERN_DARK_PRO_CLICKABLE_GIT:-true}"
MODERN_DARK_PRO_SHOW_GIT_DIFF_STATS="${MODERN_DARK_PRO_SHOW_GIT_DIFF_STATS:-false}"
MODERN_DARK_PRO_GIT_DIFF_STATS_STAGED="${MODERN_DARK_PRO_GIT_DIFF_STATS_STAGED:-false}"
MODERN_DARK_PRO_CLOCK_POSITION="${MODERN_DARK_PRO_CLOCK_POSITION:-top}"



# Enable terminal colors for BSD ls (macOS) and GNU ls (Linux)
export CLICOLOR=1
if [[ "${MODERN_DARK_PRO_VARIANT}" == "monokai" ]]; then
  export LSCOLORS="exfxcxdxbxegedabagacad"  # Monokai BSD colors
  export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=32:bd=34:cd=34:ow=36" # Monokai GNU colors
else
  export LSCOLORS="exfxcxdxbxegedabagacad"  # Night BSD colors
  export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=32:bd=34:cd=34:ow=34" # Night GNU colors
fi

# Autocomplete list-colors configuration matching the theme (specific to override Oh My Zsh)
zmodload zsh/complist 2>/dev/null
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Load stat module so we can check package.json mtime via the zstat builtin
# (no process fork) to refresh the cached project version when it changes
zmodload zsh/stat 2>/dev/null



# Symbol configurations based on Nerd Fonts toggle
if [[ "${MODERN_DARK_PRO_NERD_FONTS}" == "true" ]]; then
  # Developer / Nerd Fonts Icons (using solid/bold variants for larger visual size)
  MODERN_DARK_PRO_GIT_SYMBOL="${MODERN_DARK_PRO_GIT_SYMBOL:-}"
  MODERN_DARK_PRO_TIME_SYMBOL="${MODERN_DARK_PRO_TIME_SYMBOL:-}"
  MODERN_DARK_PRO_DIRTY_SYMBOL="${MODERN_DARK_PRO_DIRTY_SYMBOL:-}"     # Solid times circle
  MODERN_DARK_PRO_STAGED_SYMBOL="${MODERN_DARK_PRO_STAGED_SYMBOL:-}"     # Solid check circle
  MODERN_DARK_PRO_UNTRACKED_SYMBOL="${MODERN_DARK_PRO_UNTRACKED_SYMBOL:-}" # Solid question circle
  MODERN_DARK_PRO_STASHED_SYMBOL="${MODERN_DARK_PRO_STASHED_SYMBOL:-}"
  MODERN_DARK_PRO_AHEAD_SYMBOL="${MODERN_DARK_PRO_AHEAD_SYMBOL:-}"
  MODERN_DARK_PRO_BEHIND_SYMBOL="${MODERN_DARK_PRO_BEHIND_SYMBOL:-}"
  
  # Premium developer feature symbols
  MODERN_DARK_PRO_PYTHON_SYMBOL="${MODERN_DARK_PRO_PYTHON_SYMBOL:-}"   # Python logo
  MODERN_DARK_PRO_LOCK_SYMBOL="${MODERN_DARK_PRO_LOCK_SYMBOL:-}"       # Lock
  MODERN_DARK_PRO_SSH_SYMBOL="${MODERN_DARK_PRO_SSH_SYMBOL:-}"         # Server/SSH
  MODERN_DARK_PRO_JOBS_SYMBOL="${MODERN_DARK_PRO_JOBS_SYMBOL:-}"        # Gear
  MODERN_DARK_PRO_NODE_SYMBOL="${MODERN_DARK_PRO_NODE_SYMBOL:-}"        # Node.js
  MODERN_DARK_PRO_GO_SYMBOL="${MODERN_DARK_PRO_GO_SYMBOL:-}"          # Go
  MODERN_DARK_PRO_RUST_SYMBOL="${MODERN_DARK_PRO_RUST_SYMBOL:-}"        # Rust
  MODERN_DARK_PRO_TF_SYMBOL="${MODERN_DARK_PRO_TF_SYMBOL:-󱁢}"          # Terraform
  MODERN_DARK_PRO_K8S_SYMBOL="${MODERN_DARK_PRO_K8S_SYMBOL:-☸}"        # Kubernetes
  MODERN_DARK_PRO_AWS_SYMBOL="${MODERN_DARK_PRO_AWS_SYMBOL:-}"        # AWS
else
  # Standard Unicode Fallback
  MODERN_DARK_PRO_GIT_SYMBOL="${MODERN_DARK_PRO_GIT_SYMBOL:-⭠}"
  MODERN_DARK_PRO_TIME_SYMBOL="${MODERN_DARK_PRO_TIME_SYMBOL:-🕒}"
  MODERN_DARK_PRO_DIRTY_SYMBOL="${MODERN_DARK_PRO_DIRTY_SYMBOL:-✗}"
  MODERN_DARK_PRO_STAGED_SYMBOL="${MODERN_DARK_PRO_STAGED_SYMBOL:-●}"
  MODERN_DARK_PRO_UNTRACKED_SYMBOL="${MODERN_DARK_PRO_UNTRACKED_SYMBOL:-?}"
  MODERN_DARK_PRO_STASHED_SYMBOL="${MODERN_DARK_PRO_STASHED_SYMBOL:-⚑}"
  MODERN_DARK_PRO_AHEAD_SYMBOL="${MODERN_DARK_PRO_AHEAD_SYMBOL:-⇡}"
  MODERN_DARK_PRO_BEHIND_SYMBOL="${MODERN_DARK_PRO_BEHIND_SYMBOL:-⇣}"
  
  # Premium developer feature symbols
  MODERN_DARK_PRO_PYTHON_SYMBOL="${MODERN_DARK_PRO_PYTHON_SYMBOL:-py}"
  MODERN_DARK_PRO_LOCK_SYMBOL="${MODERN_DARK_PRO_LOCK_SYMBOL:-🔒}"
  MODERN_DARK_PRO_SSH_SYMBOL="${MODERN_DARK_PRO_SSH_SYMBOL:-ssh}"
  MODERN_DARK_PRO_JOBS_SYMBOL="${MODERN_DARK_PRO_JOBS_SYMBOL:-⚙}"
  MODERN_DARK_PRO_NODE_SYMBOL="${MODERN_DARK_PRO_NODE_SYMBOL:-node}"
  MODERN_DARK_PRO_GO_SYMBOL="${MODERN_DARK_PRO_GO_SYMBOL:-go}"
  MODERN_DARK_PRO_RUST_SYMBOL="${MODERN_DARK_PRO_RUST_SYMBOL:-rust}"
  MODERN_DARK_PRO_TF_SYMBOL="${MODERN_DARK_PRO_TF_SYMBOL:-tf}"
  MODERN_DARK_PRO_K8S_SYMBOL="${MODERN_DARK_PRO_K8S_SYMBOL:-k8s}"
  MODERN_DARK_PRO_AWS_SYMBOL="${MODERN_DARK_PRO_AWS_SYMBOL:-aws}"
fi



# Custom Git Status Prompt (zero-subshell via REPLY)
function _modern_dark_pro_git_prompt() {
  REPLY=""
  # Avoid executing commands if not inside Git repository
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    return
  fi

  # Cache remote URL for speed
  if [[ "${PWD}" != "${_MODERN_DARK_PRO_LAST_GIT_PWD}" ]]; then
    _MODERN_DARK_PRO_LAST_GIT_PWD="${PWD}"
    _MODERN_DARK_PRO_CACHED_GIT_REMOTE=""
    local remote_url
    remote_url=$(git config --get remote.origin.url 2>/dev/null)
    if [[ -z "${remote_url}" ]]; then
      remote_url=$(git remote -v 2>/dev/null | head -n 1 | awk '{print $2}')
    fi
    if [[ -n "${remote_url}" ]]; then
      # Convert remote URL to web URL
      remote_url="${remote_url%.git}"
      if [[ "${remote_url}" =~ "^(git@|ssh://git@)([^:/]+)[:/](.+)$" ]]; then
        local host="${match[2]}"
        local repo_path="${match[3]}"
        remote_url="https://${host}/${repo_path}"
      fi
      _MODERN_DARK_PRO_CACHED_GIT_REMOTE="${remote_url}"
    fi
  fi

  # Get branch information and status in a single Git call
  local git_status_out
  git_status_out=$(git status --porcelain -b 2>/dev/null)
  
  local -a status_lines
  status_lines=( ${(f)git_status_out} )
  local branch_line="${status_lines[1]}"
  
  local ref=""
  if [[ "${branch_line}" =~ '^## No commits yet on (.+)$' ]]; then
    ref="${match[1]}"
  elif [[ "${branch_line}" =~ '^## ([^. ]+)' ]]; then
    ref="${match[1]}"
  fi
  
  if [[ -z "${ref}" || "${ref}" == "HEAD" ]]; then
    ref=$(git rev-parse --short HEAD 2>/dev/null)
  fi

  # Check active Git operations (Rebase, Merge, Cherry-Pick, Bisect)
  local git_dir
  git_dir=$(git rev-parse --git-dir 2>/dev/null)
  if [[ -n "${git_dir}" ]]; then
    if [[ -d "${git_dir}/rebase-merge" ]]; then
      local step="" total=""
      [[ -f "${git_dir}/rebase-merge/msgnum" ]] && step=$(< "${git_dir}/rebase-merge/msgnum")
      [[ -f "${git_dir}/rebase-merge/end" ]] && total=$(< "${git_dir}/rebase-merge/end")
      if [[ -n "${step}" && -n "${total}" ]]; then
        ref+=" %F{${COLOR_ERROR}}| REBASING ${step}/${total}%f"
      else
        ref+=" %F{${COLOR_ERROR}}| REBASING%f"
      fi
    elif [[ -d "${git_dir}/rebase-apply" ]]; then
      ref+=" %F{${COLOR_ERROR}}| REBASING%f"
    elif [[ -f "${git_dir}/MERGE_HEAD" ]]; then
      ref+=" %F{${COLOR_WARNING}}| MERGING%f"
    elif [[ -f "${git_dir}/CHERRY_PICK_HEAD" ]]; then
      ref+=" %F{${COLOR_WARNING}}| CHERRY-PICKING%f"
    elif [[ -f "${git_dir}/BISECT_LOG" ]]; then
      ref+=" %F{${COLOR_WARNING}}| BISECTING%f"
    elif [[ -f "${git_dir}/REVERT_HEAD" ]]; then
      ref+=" %F{${COLOR_WARNING}}| REVERTING%f"
    fi
  fi

  local dirty=0
  local staged=0
  local untracked=0
  
  if [[ ${#status_lines} -gt 1 ]]; then
    local line
    for line in "${status_lines[@]:1}"; do
      [[ -z "${line}" ]] && continue
      local code="${line:0:2}"
      if [[ "${code}" == "??" ]]; then
        untracked=1
      else
        local index_char="${line:0:1}"
        local work_char="${line:1:1}"
        
        if [[ "${index_char}" != " " && "${index_char}" != "?" ]]; then
          staged=1
        fi
        if [[ "${work_char}" != " " && "${work_char}" != "?" ]]; then
          dirty=1
        fi
      fi
    done
  fi

  # Parse ahead/behind status
  local ahead=0
  local behind=0
  if [[ "${branch_line}" =~ 'ahead ([0-9]+)' ]]; then
    ahead="${match[1]}"
  fi
  if [[ "${branch_line}" =~ 'behind ([0-9]+)' ]]; then
    behind="${match[1]}"
  fi

  # Check stash count
  local stashed=0
  if git rev-parse --verify refs/stash &>/dev/null; then
    stashed=1
  fi

  # Line-level diff statistics (added/deleted), gated behind configuration
  local diff_added=0
  local diff_deleted=0
  if [[ "${MODERN_DARK_PRO_SHOW_GIT_DIFF_STATS}" == "true" ]]; then
    local -a numstat_sources
    numstat_sources=("git diff --numstat")
    if [[ "${MODERN_DARK_PRO_GIT_DIFF_STATS_STAGED}" == "true" ]]; then
      numstat_sources+=("git diff --cached --numstat")
    fi
    local cmd numstat_line num_a num_d
    for cmd in "${numstat_sources[@]}"; do
      while IFS=$'\t' read -r num_a num_d _; do
        [[ "${num_a}" == "-" || "${num_d}" == "-" ]] && continue  # binary files
        (( diff_added += num_a ))
        (( diff_deleted += num_d ))
      done < <(${=cmd} 2>/dev/null)
    done
  fi

  # Build indicators list using Zsh array to separate multiple icons with a space
  local -a status_items
  # Diff stats supersede the dirty symbol when enabled
  [[ $dirty -eq 1 && "${MODERN_DARK_PRO_SHOW_GIT_DIFF_STATS}" != "true" ]] && status_items+=("%F{${COLOR_ERROR}}${MODERN_DARK_PRO_DIRTY_SYMBOL}%f")
  [[ $staged -eq 1 ]] && status_items+=("%F{${COLOR_SUCCESS}}${MODERN_DARK_PRO_STAGED_SYMBOL}%f")
  [[ $untracked -eq 1 ]] && status_items+=("%F{${COLOR_WARNING}}${MODERN_DARK_PRO_UNTRACKED_SYMBOL}%f")
  [[ $stashed -eq 1 ]] && status_items+=("%F{${COLOR_WARNING}}${MODERN_DARK_PRO_STASHED_SYMBOL}%f")
  (( diff_added + diff_deleted > 0 )) && status_items+=("%F{${COLOR_SUCCESS}}+${diff_added}%f%F{${COLOR_CONNECTOR}}/%f%F{${COLOR_ERROR}}-${diff_deleted}%f")
  
  [[ $ahead -gt 0 ]] && status_items+=("%F{${COLOR_SUCCESS}}${MODERN_DARK_PRO_AHEAD_SYMBOL}${ahead}%f")
  [[ $behind -gt 0 ]] && status_items+=("%F{${COLOR_ERROR}}${MODERN_DARK_PRO_BEHIND_SYMBOL}${behind}%f")
  
  local git_url=""
  if [[ "${MODERN_DARK_PRO_CLICKABLE_GIT}" == "true" && -n "${_MODERN_DARK_PRO_CACHED_GIT_REMOTE}" && -z "${SSH_CONNECTION}" && -z "${SSH_CLIENT}" && -z "${SSH_TTY}" ]]; then
    local REPLY_URL
    _modern_dark_pro_urlencode "${ref}"
    local escaped_ref="${REPLY//\%/%%}"
    if [[ "${_MODERN_DARK_PRO_CACHED_GIT_REMOTE}" == *"bitbucket"* ]]; then
      git_url="${_MODERN_DARK_PRO_CACHED_GIT_REMOTE}/src/${escaped_ref}"
    else
      git_url="${_MODERN_DARK_PRO_CACHED_GIT_REMOTE}/tree/${escaped_ref}"
    fi
  fi

  local safe_ref="${ref//\%/%%}"
  local git_display
  if [[ -n "${git_url}" ]]; then
    git_display="%{\e]8;;${git_url}\e\\%}%F{${COLOR_GIT_BRANCH}}${MODERN_DARK_PRO_GIT_SYMBOL} ${safe_ref}%f%{\e]8;;\e\\%}"
  else
    git_display="%F{${COLOR_GIT_BRANCH}}${MODERN_DARK_PRO_GIT_SYMBOL} ${safe_ref}%f"
  fi

  # Join items with a space and add a space after '[' and before ']' for padding/breathing room
  if [[ ${#status_items} -gt 0 ]]; then
    local joined_status="${(j: :)status_items}"
    git_display+=" %F{${COLOR_CONNECTOR}}[ ${joined_status} %F{${COLOR_CONNECTOR}}]%f"
  fi

  REPLY="%F{${COLOR_CONNECTOR}} on%f ${git_display}"
}

# SSH Session Indicator (zero-subshell via REPLY)
function _modern_dark_pro_ssh_status() {
  REPLY=""
  if [[ -n "${SSH_CONNECTION}" || -n "${SSH_CLIENT}" || -n "${SSH_TTY}" ]]; then
    REPLY=" %F{${COLOR_WARNING}}${MODERN_DARK_PRO_SSH_SYMBOL} %n@%m%f"
  fi
}

# Read-Only Directory Indicator (zero-subshell via REPLY)
function _modern_dark_pro_readonly() {
  REPLY=""
  if [[ ! -w . ]]; then
    REPLY=" %F{${COLOR_ERROR}}${MODERN_DARK_PRO_LOCK_SYMBOL}%f"
  fi
}

# Python Virtualenv / Conda Indicator (zero-subshell via REPLY)
function _modern_dark_pro_venv() {
  REPLY=""
  local env_name=""
  if [[ -n "${VIRTUAL_ENV}" ]]; then
    env_name=$(basename "${VIRTUAL_ENV}")
  elif [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
    env_name="${CONDA_DEFAULT_ENV}"
  fi
  
  if [[ -n "${env_name}" ]]; then
    local safe_env="${env_name//\%/%%}"
    REPLY=" %F{#e6db74}${MODERN_DARK_PRO_PYTHON_SYMBOL} ${safe_env}%f"
  fi
}

# Running Background Jobs Indicator (zero-subshell via REPLY)
function _modern_dark_pro_jobs() {
  REPLY=""
  if [[ ${#jobstates} -gt 0 ]]; then
    REPLY=" %F{${COLOR_WARNING}}${MODERN_DARK_PRO_JOBS_SYMBOL} ${#jobstates}%f"
  fi
}

# Formats directory path based on MODERN_DARK_PRO_PATH_STYLE configuration
function _modern_dark_pro_path() {
  local style="${MODERN_DARK_PRO_PATH_STYLE:-shrink}"
  local depth="${MODERN_DARK_PRO_PATH_DEPTH:-3}"
  
  if [[ "${style}" == "shrink" ]]; then
    local path_str="%~"
    # Expand %~ first to resolve standard Zsh prompt mapping
    path_str="${(%%)path_str}"
    
    local -a parts
    parts=(${(s:/:)path_str})
    local len=${#parts}
    
    # If path is just / or ~, return it directly
    if [[ ${len} -le 1 ]]; then
      echo -n "${path_str}"
      return
    fi
    
    local -a shrunk_parts
    for ((i=1; i<len; i++)); do
      local part="${parts[i]}"
      if [[ "${part}" == "~" ]]; then
        shrunk_parts+=("~")
      elif [[ "${part}" == "."* ]]; then
        shrunk_parts+=("${part:0:2}")
      else
        shrunk_parts+=("${part:0:1}")
      fi
    done
    shrunk_parts+=("${parts[len]}")
    
    local result="${(j:/:)shrunk_parts}"
    if [[ "${path_str:0:1}" == "/" && "${result:0:1}" != "/" ]]; then
      echo -n "/${result}"
    else
      echo -n "${result}"
    fi
  elif [[ "${style}" == "limit" ]]; then
    echo -n "%${depth}~"
  else
    echo -n "%~"
  fi
}

# URL encodes a string using pure Zsh parameter expansion (blazingly fast)
# Assigns the result to the REPLY variable to avoid command substitution overhead
function _modern_dark_pro_urlencode() {
  setopt localoptions extendedglob
  local input="${1}"
  REPLY="${input//(#b)([^a-zA-Z0-9._\-\/])/%${(l:2::0:)$(([##16]#match))}}"
}


# Runtimes caching variables to keep prompt blazingly fast
_MODERN_DARK_PRO_LAST_PWD=""
_MODERN_DARK_PRO_LAST_PATH=""
_MODERN_DARK_PRO_CACHED_NODE=""
_MODERN_DARK_PRO_NODE_PKG_MTIME=""
_MODERN_DARK_PRO_CACHED_GO=""
_MODERN_DARK_PRO_CACHED_RUST=""
_MODERN_DARK_PRO_CACHED_TF=""
_MODERN_DARK_PRO_PATH_URL=""
_MODERN_DARK_PRO_LAST_GIT_PWD=""
_MODERN_DARK_PRO_CACHED_GIT_REMOTE=""




# Updates runtimes versions only if PWD or PATH has changed (highly optimized)
function _modern_dark_pro_update_runtimes() {
  local pkg_mtime=""
  if [[ "${MODERN_DARK_PRO_NODE_PROJECT_VERSION}" == "true" && -f package.json ]]; then
    pkg_mtime=$(zstat +mtime package.json 2>/dev/null)
  fi
  if [[ "${PWD}" == "${_MODERN_DARK_PRO_LAST_PWD}" && "${PATH}" == "${_MODERN_DARK_PRO_LAST_PATH}" \
     && "${pkg_mtime}" == "${_MODERN_DARK_PRO_NODE_PKG_MTIME}" ]]; then
    return
  fi
  _MODERN_DARK_PRO_LAST_PWD="${PWD}"
  _MODERN_DARK_PRO_LAST_PATH="${PATH}"
  _MODERN_DARK_PRO_NODE_PKG_MTIME="${pkg_mtime}"

  # 1. Node.js
  _MODERN_DARK_PRO_CACHED_NODE=""
  if [[ "${MODERN_DARK_PRO_NODE_PROJECT_VERSION}" == "true" ]]; then
    # Show project's own version from package.json instead of installed node
    if [[ -f package.json ]] && (( $+commands[node] )); then
      local pkg_version=$(node -p 'require("./package.json").version' 2>/dev/null)
      [[ "${pkg_version}" == "undefined" ]] && pkg_version=""
      _MODERN_DARK_PRO_CACHED_NODE="${pkg_version}"
    fi
  elif [[ -f package.json || -d node_modules ]]; then
    if (( $+commands[node] )); then
      _MODERN_DARK_PRO_CACHED_NODE=$(node -v 2>/dev/null)
    fi
  fi

  # 2. Go
  _MODERN_DARK_PRO_CACHED_GO=""
  local -a go_files
  go_files=( *.go(N) )
  if [[ -f go.mod ]] || (( ${#go_files} > 0 )); then
    if (( $+commands[go] )); then
      _MODERN_DARK_PRO_CACHED_GO=$(go env GOVERSION 2>/dev/null)
    fi
  fi

  # 3. Rust
  _MODERN_DARK_PRO_CACHED_RUST=""
  if [[ -f Cargo.toml ]]; then
    if (( $+commands[rustc] )); then
      local rust_v=$(rustc -V 2>/dev/null)
      _MODERN_DARK_PRO_CACHED_RUST="v${rust_v#*rustc }"
      _MODERN_DARK_PRO_CACHED_RUST="${_MODERN_DARK_PRO_CACHED_RUST%% *}"
    fi
  fi

  # 4. Terraform
  _MODERN_DARK_PRO_CACHED_TF=""
  local -a tf_files
  tf_files=( *.tf(N) )
  if [[ -f .terraform/environment ]]; then
    _MODERN_DARK_PRO_CACHED_TF=$(cat .terraform/environment 2>/dev/null)
  elif (( ${#tf_files} > 0 )); then
    _MODERN_DARK_PRO_CACHED_TF="default"
  fi
}

# Node.js Display (zero-subshell via REPLY)
function _modern_dark_pro_node() {
  REPLY=""
  if [[ -n "${_MODERN_DARK_PRO_CACHED_NODE}" ]]; then
    REPLY=" %F{#81c784}${MODERN_DARK_PRO_NODE_SYMBOL} ${_MODERN_DARK_PRO_CACHED_NODE}%f"
  fi
}

# Go Display (zero-subshell via REPLY)
function _modern_dark_pro_go() {
  REPLY=""
  if [[ -n "${_MODERN_DARK_PRO_CACHED_GO}" ]]; then
    REPLY=" %F{#4dd0e1}${MODERN_DARK_PRO_GO_SYMBOL} ${_MODERN_DARK_PRO_CACHED_GO}%f"
  fi
}

# Rust Display (zero-subshell via REPLY)
function _modern_dark_pro_rust() {
  REPLY=""
  if [[ -n "${_MODERN_DARK_PRO_CACHED_RUST}" ]]; then
    REPLY=" %F{#e57373}${MODERN_DARK_PRO_RUST_SYMBOL} ${_MODERN_DARK_PRO_CACHED_RUST}%f"
  fi
}

# Terraform Display (zero-subshell via REPLY)
function _modern_dark_pro_terraform() {
  REPLY=""
  if [[ -n "${_MODERN_DARK_PRO_CACHED_TF}" ]]; then
    REPLY=" %F{#ba68c8}${MODERN_DARK_PRO_TF_SYMBOL} ${_MODERN_DARK_PRO_CACHED_TF}%f"
  fi
}

# Kubernetes Context Display (zero-subshell via REPLY)
function _modern_dark_pro_k8s() {
  REPLY=""
  local config_file="${KUBECONFIG:-$HOME/.kube/config}"
  if [[ -f "${config_file}" ]]; then
    local ctx
    ctx=$(grep 'current-context:' "${config_file}" 2>/dev/null | awk '{print $2}')
    if [[ -n "${ctx}" ]]; then
      REPLY=" %F{#64b5f6}${MODERN_DARK_PRO_K8S_SYMBOL} ${ctx}%f"
    fi
  fi
}

# AWS Profile Display (zero-subshell via REPLY)
function _modern_dark_pro_aws() {
  REPLY=""
  if [[ -n "${AWS_PROFILE}" ]]; then
    local region="${AWS_DEFAULT_REGION:-${AWS_REGION}}"
    local display="${AWS_PROFILE}"
    [[ -n "${region}" ]] && display+="@${region}"
    REPLY=" %F{#ffb74d}${MODERN_DARK_PRO_AWS_SYMBOL} ${display}%f"
  fi
}

# Execution Time Measurement Hooks
function _modern_dark_pro_preexec() {
  if [[ "${MODERN_DARK_PRO_SHOW_EXEC_TIME}" == "true" ]]; then
    zmodload zsh/datetime
    _MODERN_DARK_PRO_START_TIME=$EPOCHREALTIME
  fi
}

function _modern_dark_pro_precmd() {
  local exit_code=$?
  
  # Calculate execution time
  local elapsed_time=""
  if [[ -n "${_MODERN_DARK_PRO_START_TIME}" ]]; then
    zmodload zsh/datetime
    local end_time=$EPOCHREALTIME
    local elapsed
    (( elapsed = end_time - _MODERN_DARK_PRO_START_TIME ))
    unset _MODERN_DARK_PRO_START_TIME
    
    if (( elapsed >= MODERN_DARK_PRO_EXEC_TIME_MIN )); then
      if (( elapsed >= 60.0 )); then
        local -i mins
        local secs
        (( mins = elapsed / 60 ))
        (( secs = elapsed - mins * 60 ))
        elapsed_time=$(printf "%%F{%s}%s %dm %.2fs%%f" "${COLOR_EXEC_TIME}" "${MODERN_DARK_PRO_TIME_SYMBOL}" "${mins}" "${secs}")
      else
        elapsed_time=$(printf "%%F{%s}%s %.1fs%%f" "${COLOR_EXEC_TIME}" "${MODERN_DARK_PRO_TIME_SYMBOL}" "${elapsed}")
      fi
    fi
  fi

  # Dynamic prompt character coloring based on success/failure & root privilege check
  local char="${MODERN_DARK_PRO_CHAR}"
  if [[ ${EUID:-$(id -u)} -eq 0 ]]; then
    char="#"
    _MODERN_DARK_PRO_PROMPT_CHAR="%F{${COLOR_ERROR}}${char}%f"
  elif [[ $exit_code -eq 0 ]]; then
    _MODERN_DARK_PRO_PROMPT_CHAR="%F{${COLOR_SUCCESS}}${char}%f"
  else
    _MODERN_DARK_PRO_PROMPT_CHAR="%F{${COLOR_ERROR}}${char}%f"
  fi

  # Precompute expensive/dynamic prompt sections
  _modern_dark_pro_update_runtimes
  _MODERN_DARK_PRO_PATH_VAL=$(_modern_dark_pro_path)
  
  # Generate OSC 8 URL for clickable path if enabled and not SSH session
  _MODERN_DARK_PRO_PATH_URL=""
  if [[ "${MODERN_DARK_PRO_CLICKABLE_PATH}" == "true" && -z "${SSH_CONNECTION}" && -z "${SSH_CLIENT}" && -z "${SSH_TTY}" ]]; then
    local REPLY
    _modern_dark_pro_urlencode "${PWD}"
    local escaped_url="${REPLY//\%/%%}"
    _MODERN_DARK_PRO_PATH_URL="file://${escaped_url}"
  fi
  
  REPLY=""; _modern_dark_pro_git_prompt; _MODERN_DARK_PRO_GIT_STATUS="${REPLY}"
  REPLY=""; _modern_dark_pro_ssh_status; _MODERN_DARK_PRO_SSH_STATUS="${REPLY}"
  REPLY=""; _modern_dark_pro_readonly; _MODERN_DARK_PRO_READONLY="${REPLY}"
  REPLY=""; _modern_dark_pro_venv; _MODERN_DARK_PRO_VENV="${REPLY}"
  REPLY=""; _modern_dark_pro_jobs; _MODERN_DARK_PRO_JOBS="${REPLY}"
  
  # Runtimes and Cloud indicators
  REPLY=""; _modern_dark_pro_node; _MODERN_DARK_PRO_NODE="${REPLY}"
  REPLY=""; _modern_dark_pro_go; _MODERN_DARK_PRO_GO="${REPLY}"
  REPLY=""; _modern_dark_pro_rust; _MODERN_DARK_PRO_RUST="${REPLY}"
  REPLY=""; _modern_dark_pro_terraform; _MODERN_DARK_PRO_TF="${REPLY}"
  REPLY=""; _modern_dark_pro_k8s; _MODERN_DARK_PRO_K8S="${REPLY}"
  REPLY=""; _modern_dark_pro_aws; _MODERN_DARK_PRO_AWS="${REPLY}"
  
  if [[ -n "${elapsed_time}" ]]; then
    _MODERN_DARK_PRO_ELAPSED_TIME=" ${elapsed_time}"
  else
    _MODERN_DARK_PRO_ELAPSED_TIME=""
  fi
}

# Renders the first line of the prompt with a dynamic right-aligned clock
function _modern_dark_pro_first_line() {
  local path_block="%F{${COLOR_PATH}}${_MODERN_DARK_PRO_PATH_VAL}%f"
  if [[ -n "${_MODERN_DARK_PRO_PATH_URL}" ]]; then
    path_block="%{\e]8;;${_MODERN_DARK_PRO_PATH_URL}\e\\%}${path_block}%{\e]8;;\e\\%}"
  fi

  local left="%F{${COLOR_CONNECTOR}}┌─%f${_MODERN_DARK_PRO_SSH_STATUS} ${path_block}${_MODERN_DARK_PRO_READONLY}${_MODERN_DARK_PRO_GIT_STATUS}${_MODERN_DARK_PRO_VENV}${_MODERN_DARK_PRO_NODE}${_MODERN_DARK_PRO_GO}${_MODERN_DARK_PRO_RUST}${_MODERN_DARK_PRO_TF}${_MODERN_DARK_PRO_K8S}${_MODERN_DARK_PRO_AWS}${_MODERN_DARK_PRO_JOBS}${_MODERN_DARK_PRO_ELAPSED_TIME}"
  
  # Expand prompt escape sequences to compute visual width
  local expanded_left="${(%%)left}"
  
  # Strip OSC 8 hyperlinks and ANSI color escape sequences for exact visual width calculation
  local clean_left="${expanded_left}"
  while [[ "${clean_left}" =~ $'\x1b\\]8;;[^\x1b]*\x1b\\\\' ]]; do
    clean_left="${clean_left/$MATCH/}"
  done
  setopt local_options extended_glob
  clean_left="${clean_left//$'\x1b'\[[0-9;]##[a-zA-Z]/}"
  local left_width=${(m)#clean_left}
  
  if [[ "${MODERN_DARK_PRO_CLOCK_POSITION}" == "rprompt" ]]; then
    echo -n "${left}"
    return
  fi

  # Prepare the right-aligned clock block
  local right="%F{${COLOR_CONNECTOR}}${MODERN_DARK_PRO_TIME_SYMBOL} %D{%H:%M:%S}%f"
  local expanded_right="${(%%)right}"
  local clean_right="${expanded_right//$'\x1b'\[[0-9;]##[a-zA-Z]/}"
  local right_width=${(m)#clean_right}
  
  # Determine dynamic terminal column width (fallback to stty / tput if COLUMNS is stale)
  local cols="${COLUMNS:-0}"
  local tty_cols=$(stty size 2>/dev/null | awk '{print $2}')
  if [[ -n "${tty_cols}" && "${tty_cols}" -gt "${cols}" ]]; then
    cols="${tty_cols}"
  fi
  local tput_c=$(tput cols 2>/dev/null)
  if [[ -n "${tput_c}" && "${tput_c}" -gt "${cols}" ]]; then
    cols="${tput_c}"
  fi
  [[ "${cols}" -le 0 ]] && cols=80

  # Calculate required padding width (subtracting left/right width from terminal columns)
  local pad_width=$(( cols - left_width - right_width ))
  local padding=" "
  if (( pad_width > 1 )); then
    padding=""
    for ((i=1; i<=pad_width; i++)); do
      padding+=" "
    done
  fi
  
  echo -n "${left}${padding}${right}"
}

# Zsh Hooks registration
autoload -Uz add-zsh-hook
add-zsh-hook preexec _modern_dark_pro_preexec
add-zsh-hook precmd _modern_dark_pro_precmd

# Define the Prompt
# First Line:  ┌─ [ssh] [path] [readonly] [git] [venv] [node] [go] [rust] [tf] [k8s] [aws] [jobs] [duration]                 [clock]
# Second Line: └─ ❯ 
PROMPT='$(_modern_dark_pro_first_line)
%F{${COLOR_CONNECTOR}}└─%f ${_MODERN_DARK_PRO_PROMPT_CHAR} '

if [[ "${MODERN_DARK_PRO_CLOCK_POSITION}" == "rprompt" ]]; then
  RPROMPT='%F{${COLOR_CONNECTOR}}${MODERN_DARK_PRO_TIME_SYMBOL} %D{%H:%M:%S}%f'
else
  RPROMPT=''
fi


