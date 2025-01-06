# Source: https://git.rustylab.net/Naoto/dotfiles/src/branch/master/zsh/.zsh/deferred-eval-source.zsh

# This loads fnm in background
# Generates script and sources it when it's ready.
# Makes startup times faster

trap 'source /tmp/zsh_deferred_source.$$ && rm /tmp/zsh_deferred_source.$$' USR2
zi () {}
deferred_source_prepare () {
    fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh >> /tmp/zsh_deferred_source.$$
    jenv init - > /tmp/zsh_deferred_source.$$
    sleep 0.2
    kill -s USR2 $$ > /dev/null 2> /dev/null
}

deferred_source_prepare &!