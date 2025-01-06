#!/bin/bash

# Core settings
git config --global core.autocrlf false

# Aliases
git config --global alias.amend "commit --amend --no-edit --reset-author --date=now"
git config --global alias.undo "reset --soft HEAD^"
git config --global alias.stash-all "stash save --include-untracked"
git config --global alias.glog "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config --global alias.delete-merged '!f() { git checkout --quiet master && git branch --merged | grep --invert-match '\''\\*'\'' | xargs -n 1 git branch --delete; git checkout --quiet @{-1}; }; f'
git config --global alias.cob '!f() { git checkout -B $1 origin/$1 }; f'
git config --global alias.create '!f() { git checkout -b $1 -t origin/$1}; f'

# Fetch settings
git config --global fetch.prune true

# Pull settings
git config --global pull.rebase true

# Push settings
git config --global push.autoSetupRemote true

# LFS settings
git config --global filter.lfs.clean "git-lfs clean -- %f"
git config --global filter.lfs.smudge "git-lfs smudge -- %f"
git config --global filter.lfs.process "git-lfs filter-process"
git config --global filter.lfs.required true