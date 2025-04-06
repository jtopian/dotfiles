# JT's Dotfiles
These files make up most of my Linux ux. Hopefully you find something useful here.

![Screenshot of my desktop with tmux and rofi visible](images/desktop.png?raw=true "Desktop screenshot")

## Usage
```
git clone git@github.com:jtopian/dotfiles.git ~/.config/dotfiles
cd .config/dotfiles
# Use --adopt with caution!
stow -t $HOME --dotfiles --no-folding [--adopt] <app to stow>
```

## i3

After stowing i3 files, run `$HOME/i3/config/scripts/buildconf.sh` once to
build the initial config. This is constructed of .conf files in `$HOME/i3/config/conf.d/`.

`buildconf.sh` will rerun automatically when restarting i3
with `$mod+r`. So far, reloading config with `$mod+c` has led to crashes :(

Requires the i3ipc module for Python, install with pip like so:

    pip install --user i3ipc

Oof, there's probably a better way to do that. I don't want to ship venvs, though. Hmmm.

## Hyprland

This hyprland config depends on `waybar`, as it references the waybar.service unit file in the requirements for the hyprland-session.target. If you do not wish to use waybar, adjust `hyprland/dot-config/systemd/user/hyprland-session.target` as necessary.
