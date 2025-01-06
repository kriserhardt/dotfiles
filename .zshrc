# Defer loading of fnm, jenv, and starship
source "$DOTFILES/zsh/deferred-eval-source.zsh" 

HISTFILE=~/.zsh_history                                  # File where history is stored
HISTSIZE=1000000
SAVEHIST=1000000

setopt appendhistory                                     # Enable history
setopt extendedhistory                                   # Timestamps in history
setopt incappendhistory                                  # Write history immediately
setopt histfindnodups                                    # Skip duplicates in history

zstyle ':completion:*' menu select                       # Highlight completion option
 
bindkey -v '^?' backward-delete-char                     # BACKSPACE key enable
bindkey -v "^[[H"  beginning-of-line                     # HOME key enable
bindkey -v "^[[F"  end-of-line                           # END key enable
bindkey -v "^[[3~" delete-char                           # DELETE key enable

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=blue,bold"

zstyle ":completion:*:commands" rehash 1                 # Better completion for newly installed commands (ignores cache)

bindkey '^[[A' history-substring-search-up               # Arrow up for history search up
bindkey '^[[B' history-substring-search-down             # Arrow down for history search down
bindkey -M vicmd 'k' history-substring-search-up         # K for history search up in vim normal mode
bindkey -M vicmd 'j' history-substring-search-down       # J for history search down in vim normal mode
bindkey '^[[Z' reverse-menu-complete                     # SHIFT+TAB for previous completion

autoload -Uz compinit                                    # Enable completions
compinit

# Init Starship
eval "$(starship init zsh)"

# Completions
eval "$(fnm completions --shell zsh)"

source "$DOTFILES/zsh/aliases.zsh"  

# External plugins
source "${HOMEBREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

