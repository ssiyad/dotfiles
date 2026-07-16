function fish_mode_prompt --description 'Show the vi mode indicator'
    switch $fish_bind_mode
        case insert
            return
        case default
            set_color --bold f38ba8
            echo -n '(normal)'
        case replace replace_one
            set_color --bold fab387
            echo -n '(replace)'
        case visual
            set_color --bold cba6f7
            echo -n '(visual)'
        case '*'
            set_color --bold f38ba8
            echo -n '[?]'
    end
    set_color normal
    echo -n ' '
end
