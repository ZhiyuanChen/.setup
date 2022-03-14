source /usr/share/zsh/antigen.zsh

antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k

antigen bundle catimg
antigen bundle command-not-found
antigen bundle cp
antigen bundle git
antigen bundle gitfast
antigen bundle github
antigen bundle history
antigen bundle pip
antigen bundle please
antigen bundle python
antigen bundle ssh-agent
antigen bundle thefuck
antigen bundle tmux
antigen bundle web-search
antigen bundle z
antigen bundle sobolevn/wakatime-zsh-plugin
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

eval $(thefuck --alias)

