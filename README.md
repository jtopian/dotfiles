## Usage

    git clone https://gitlab.jtopia.org/xaxas/i3-dotfiles.git ~/.stow-gui
    cd .stow-gui
    stow <desired app config>
    # easy mode:
    # for i in compton dunst i3 polybar rofi Xresources; do stow $i; done

## i3

After stowing i3 files, run $HOME/i3/config/scripts/buildconf.sh once to
build the initial config. This is constructed of .conf files in
$HOME/i3/config/config.d/.
