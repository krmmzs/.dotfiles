# dotfiles

[dotfiles tutorial](https://dotfiles.github.io/)

Your unofficial guide to dotfiles on GitHub.

## Usage

Pull the repository, and then create the symbolic links using [GNU stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow).

```shell
git clone git@github.com:alexpearce/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow zsh vim git # plus whatever else you'd like
```
