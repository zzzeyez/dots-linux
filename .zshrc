# colors
(cat ~/.cache/wal/sequences)
source ~/.cache/wal/colors.sh

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

export XDG_SESSION_TYPE=wayland
export WLR_NO_HARDWARE_CURSORS=1
#is this causing flickers
#export XWAYLAND_NO_GLAMOR=1
#is this crashing me
#export WLR_EGL_NO_MODIFIERS=1

# ZSH_THEME="zzzeyez"
# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.oh-my-zsh/custom/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/themes/.p10k.zsh
source ~/.oh-my-zsh/custom/themes/p10k.zsh

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# oh-my-zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-very-colorful-manuals)
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-git-prompt/zshrc.sh

# colorlovers fzy selector
fzycol() {
  fzycol="$(ls ~/.config/wal/colorschemes/colorlovers | fzy)" && colorlovers -l "$(echo $fzycol | cut -f 1 -d '.')" > /dev/null && reload-dunst > /dev/null & bar > /dev/null & disown && sleep 0.1 && wal-set-linux > /dev/null && notify-send "$(cat $HOME/.cache/colorlovers/colorlovers)"
}

# search & destroy
fzykill() {
  ps aux | fzy | awk '{ print $2 }' | xargs kill
}

# fff file manager
#c() {
	#source ${HOME}/.config/fff
    #fff "$@"
    #cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
#}

# lf file manager
f() {
	lf .
}

# cd fzf
c() {
  # workaround because canceling commands does `cd ~`
  FZYDIR="$(fd --hidden --type directory --exclude /.cache --exclude /Library --exclude /.thugpro --exclude /.origin . ~ | fzy)"
  cd "$FZYDIR"
}

# rm to trash
rm() {
	rmtrash "$@"
}

# exit
;q() {
	exit
}

# nvim
function n() {
    if [ "$1" != "" ]
    then
        nvim $1
    else
        nvim .
    fi
}

# iterm2italics fix
#export TERM=xterm-256color-italic

# nvim man page
export MANPAGER='nvim +Man!'

# remove right padding
ZLE_RPROMPT_INDENT=0

