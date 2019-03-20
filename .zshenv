if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export PATH="$HOME/.cargo/bin:$PATH"

# Enable traybar support for Electron apps in the Swaybar
export XDG_CURRENT_DESKTOP=Unity

export LD_LIBRARY_PATH=LD_LIBRARY_PATH:/usr/local/lib64/
