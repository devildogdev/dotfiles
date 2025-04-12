HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

typeset -U path
path=($HOME/.local/bin $HOME/go/bin/ /opt/homebrew/opt/postgresql@15/bin $path)

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=none
export LESSHISTFILE=-
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_STATESEPARATOR=""
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#000000,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
setopt nobeep extendedglob nomatch histsavenodups histignorespace
bindkey -v

typeset -g -A key

bindkey "^?" backward-delete-char
bindkey "^N" menu-complete
bindkey "^P" reverse-menu-complete
bindkey "^Y" end-of-line

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
source <(fzf --zsh)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:${FPATH}
  autoload -Uz compinit; compinit
fi

zstyle ':completion:*' menu select

virtualenv_prompt() {
    [[ "$VIRTUAL_ENV" == "" ]] && return

    local venv_name="${VIRTUAL_ENV##*/}"
    if typeset -f deactivate >/dev/null; then
        echo "%F{8}${venv_name}%f "
    fi
}

source ~/.config/zsh/git-prompt.sh
setopt PROMPT_SUBST
precmd() { __git_ps1 '$(virtualenv_prompt)%B%F{4}%3~%f%b' ' %# ' ' %s'}

alias ls='ls --color=auto'
alias notes='cd ~/Documents/notes'
alias dotfiles='cd ~/repos/dotfiles'
alias love='/Applications/love.app/Contents/MacOS/love'
