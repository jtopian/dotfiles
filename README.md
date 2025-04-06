## Usage
```
git clone git@github.com:jtopian/gui-dotfiles.git ~/.stow-gui
cd .stow-gui
# Use --adopt with caution!
stow -t $HOME --dotfiles --no-folding [--adopt] <app to stow>

# easy mode:
# for i in compton dunst i3 polybar rofi Xresources; do stow $i; done
```

## i3

After stowing i3 files, run `$HOME/i3/config/scripts/buildconf.sh` once to
build the initial config. This is constructed of .conf files in `$HOME/i3/config/conf.d/`.

`buildconf.sh` will rerun automatically when restarting i3
with `$mod+r`. So far, reloading config with `$mod+c` has led to crashes :(

Requires the i3ipc module for Python, install with pip like so:

    pip install --user i3ipc

## Hyprland

This hyprland config depends on `waybar` (config not included in this repository), as it references the waybar.service unit file in the requirements for the hyprland-session.target.
