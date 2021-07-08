# EEEEEE
# EE           EmJames 
# EEE  JJJJJ   http://www.emjames.com 
# EE      JJ
# EEEEEE  JJ
#    JJ   JJ
#      JJJJ
#
#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Don't share history
setopt no_share_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Use neovim-remote for synctex
alias nvim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# EmJames aliases
#
alias config='c(){ /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@" };c'
alias touchej='f(){ touch "$@" ; cat Documents/header_ej.txt > "$@"; }; f'
alias university='$HOME/Workspace/NCTU/'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias i3rc='nvim ~/.config/i3/config'
alias wifi='nmcli d wifi'
alias open='xdg-open'
# open in the background disown
alias openb='openb(){ open $1 &! }; openb'
alias present='pdfpc'
alias notes='Joplin'
alias vim='nvim'
alias citExplorer="java -jar ~/Applications/CiteNetExplorer/CitNetExplorer.jar &"
alias pingg="ping www.google.com -c 5"

# EmJames exports
export XDG_CONFIG_HOME=$HOME/.config


# Use nVim as default editor
export VISUAL='nvr'
export EDITOR=$VISUAL
# Enable Vim keybindings
bindkey -v

exec whatis $(ls /bin) 2>/dev/null | shuf -n 1 | cowsay -b -W 80

export TERMINFO=/usr/share/terminfo
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Workspace/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Workspace/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/Workspace/anaconda3/etc/profile.d/conda.sh"
    else
       export PATH="$HOME/Workspace/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Add local Applications to path
export PATH="$PATH:$HOME/bin/"

# Add .local/bin to path
export PATH="$PATH:$HOME/.local/bin"

# Add local bin npm to path
export PATH="$PATH:$HOME/.npm-packages/bin/"

# Add Java
JAVA_HOME=/usr/local/java/jdk1.8.0_261
export JAVA_HOME
export PATH="$PATH:$HOME/bin:$JAVA_HOME/bin"

# Sync ranger path with shell
alias ranger='source ranger'

# The word python is too long
alias py='python'

# search in zsh completion with vi
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# LaTeX aliases
function newbeamer() {
    # Note the lack of spaces at the equal sign
    folder="."
    name="Presentation"

    if [[ $1 ]]; then
        folder=$1
    fi

    if [[ $2 ]]; then
        name=$2
    fi

    if [[ -d "$folder/$name" ]] then
        print "$folder/$name exists. Check folder and name, then try again."
        return 1
    fi

    print "Presentation location: $folder/$name"
    cp -r $HOME/Documents/LaTeX_Templates/Presentations/ "$folder/$name"

    return 0
}

# IBUS
export GTK_IM_MODULE=ibus
export XMODIfiERS=@im=bus
export QT_IM_MODULE=ibus

# Unzip
function unzipd() {
    if [[ $# != 1 ]] then
        echo "Name of archive to extract is missing";
        return 1;
    fi

    zipfile="$1"
    zipdir=${1%.zip}

    unzip -d "$zipdir" "$zipfile"
}

# Include PlatformIO in path
export PATH="$PATH:$HOME/.platformio/penv/bin/"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source $HOME/.rvm/scripts/rvm
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# TexLive
# Set path to include TexLive
# if [ -d "$HOME/TeX/texlive/tlpkg/TeXLive/

function randomtoken() {
    od -d /dev/urandom | head -1 | sha512sum
}

# RStudio
export QT_QMAKE_EXECUTABLE="$HOME/Workspace/Qt/5.12.8/gcc_64/bin/qmake"
