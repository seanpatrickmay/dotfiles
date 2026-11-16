
alias vim=nvim
alias vi=nvim

# Claude Code Config
export CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=75

# Claude Code Aliases — Personal (Max subscription, default ~/.claude)
alias cc='claude'
alias ccp='claude --plan'
alias cch='claude --help'
alias ccr='claude review'
alias ccst='claude status'
alias ccd='claude --dangerously-skip-permissions'
alias ccrd='claude --resume --dangerously-skip-permissions'

# Claude Code Aliases — Work (~/.claude-work)
alias ccdw='CLAUDE_CONFIG_DIR=~/.claude-work claude --dangerously-skip-permissions'
alias ccrdw='CLAUDE_CONFIG_DIR=~/.claude-work claude --resume --dangerously-skip-permissions'

# Claude Code Aliases — School (~/.claude-school)
alias ccds='CLAUDE_CONFIG_DIR=~/.claude-school claude --dangerously-skip-permissions'
alias ccrds='CLAUDE_CONFIG_DIR=~/.claude-school claude --resume --dangerously-skip-permissions'

# Development Shortcuts
alias dev='npm run dev'
alias lint='npm run lint'
alias ntest='npm test'
alias build='npm run build'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline -10'

# Project Navigation
alias proj='cd ~/Desktop/CurrentProjects'
alias life='cd ~/Desktop/CurrentProjects/Life-Dashboard'
alias comic='cd ~/Desktop/CurrentProjects/comic'
alias news='cd ~/Desktop/CurrentProjects/data-scraper'
alias wild='cd ~/Desktop/CurrentProjects/wildfire-prediction'

# Claude Scripts
alias claude-setup='~/.claude/scripts/auto-setup.sh'
alias claude-test='~/.claude/scripts/quick-test.sh'
alias claude-scan='~/.claude/scripts/project-scanner.sh'

# Quick Functions
function ccsetup() {
    echo "🚀 Running Claude Code setup for current project..."
    ~/.claude/scripts/auto-setup.sh .
}

function ccscan() {
    echo "🔍 Scanning project with Claude Code..."
    ~/.claude/scripts/project-scanner.sh .
}

function cctest() {
    echo "🧪 Running tests with Claude Code..."
    ~/.claude/scripts/quick-test.sh .
}

function ccnew() {
    # Quick project starter
    if [ -z "$1" ]; then
        echo "Usage: ccnew <project-name> [template]"
        echo "Templates: react, fastapi, fullstack, cli"
        return 1
    fi

    project_name=$1
    template=${2:-react}

    case $template in
        react)
            echo "Creating React TypeScript project..."
            npm create vite@latest $project_name -- --template react-ts
            cd $project_name
            npm install
            echo "✅ React project created!"
            ;;
        fastapi)
            echo "Creating FastAPI project..."
            mkdir $project_name && cd $project_name
            python3 -m venv venv
            source venv/bin/activate
            pip install fastapi uvicorn sqlalchemy alembic python-dotenv
            echo "✅ FastAPI project created!"
            ;;
        fullstack)
            echo "Creating full-stack project..."
            mkdir $project_name && cd $project_name
            mkdir frontend backend
            echo "✅ Full-stack structure created!"
            echo "Run 'ccnew frontend react' and 'ccnew backend fastapi' to set up each part"
            ;;
        cli)
            echo "Creating CLI project..."
            mkdir $project_name && cd $project_name
            npm init -y
            npm install commander chalk inquirer
            echo "✅ CLI project created!"
            ;;
        *)
            echo "Unknown template: $template"
            return 1
            ;;
    esac
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


test -e /Users/seanmay/.iterm2_shell_integration.zsh && source /Users/seanmay/.iterm2_shell_integration.zsh || true
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/seanmay/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
export PATH="$HOME/.local/bin:$PATH"
eval "$(mise activate zsh)"

# VCC: Source local config (nvm, env vars, server utilities)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
