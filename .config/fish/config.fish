source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

# opencode
fish_add_path /home/tn/.opencode/bin

# starship
starship init fish | source
