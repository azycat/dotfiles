# `$HOME`
azycat's home

built with neovim, zsh, skhd

##  how2install

`git clone --separate-git-dir=$HOME/.dotfiles https://github.com/azycat/dotfiles.git dotfiles-tmp`

- linux/macos (zsh)

```
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -rf dotfiles-tmp
echo alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' >> $HOME/.zsh
```

- windows

```
Copy-Item -Path "$HOME\dotfiles-tmp\*" -Destination "$HOME/" -Recurse -Exclude ".git"
Remove-Item -Force -Recurse -Path "$HOME\dotfiles-tmp\"
```
