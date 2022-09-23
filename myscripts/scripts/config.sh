#!/bin/zsh

if [[ $EDITOR == '' ]] {
  echo 'no EDITOR is specified, use vim'
  EDITOR=nvim
}
echo $EDITOR

case $1 in
    zsh)
        $EDITOR /home/$USER/.zshrc 
        ;;
    tmux)
        $EDITOR /home/$USER/.tmux.conf
        ;;
    nvim)
        $EDITOR /home/$USER/.config/nvim/init.lua
        ;;
    vim)
        $EDITOR /home/$USER/.vimrc
        ;;
    snippets)
        $EDITOR /home/$USER/.config/nvim/snippets/
        ;;
        
    *)
      {
        $EDITOR /home/$USER/.config/$1/*conf*
      } always {
        echo "== ! conf: missing or invalid argument ! =="
        exit 2
      }
esac

exit 0
