antidote_root="${ANTIDOTE_HOME:-${ZDOTDIR:-$HOME}/.antidote}"
zsh_plugins_base="${ZDOTDIR:-$HOME}/.zsh_plugins"
zsh_plugins_txt="${zsh_plugins_base}.txt"
zsh_plugins_static="${zsh_plugins_base}.zsh"

if [[ -f "${antidote_root}/antidote.zsh" && -f "${zsh_plugins_txt}" ]]; then
    if [[ ! -f "${zsh_plugins_static}" || "${zsh_plugins_txt}" -nt "${zsh_plugins_static}" || "${antidote_root}/antidote.zsh" -nt "${zsh_plugins_static}" ]]; then
        (
            source "${antidote_root}/antidote.zsh"
            antidote bundle <"${zsh_plugins_txt}" >|"${zsh_plugins_static}"
        )
    fi
    source "${zsh_plugins_static}"
fi

export PATH="$HOME/.local/bin:$PATH"

if (( $+commands[nvim] )); then
    alias vim=nvim
fi

if (( $+commands[thefuck] )); then
    eval "$(thefuck --alias)"
fi

# Some useful helper commands.
function mbp() { mv "$@" ~/.bkup; }
function lesspdf() { pdftotext "$@" - | less; }
function vimdiff() { vim -d "$@"; }
