json = require("json")

root = menu.my_root()
script_dir = filesystem.scripts_dir() .. "Theme Manager"
theme_dir = filesystem.stand_dir() .. "Theme"
themes_path = script_dir .. "\\themes.txt"

local color_commands = {
    primary = "primary",
    focused_text = "focustext",
    -- focused_text_opacity = "focustextopacity",
    focused_right_bound_text = "focusrighttext",
    -- focused_right_bound_text_opacity = "focusrighttextopacity",
    focused_texture = "focustexture",
    -- focused_texture_opacity = "focustextureopacity",
    background = "background",
    -- background_opacity = "backgroundpacity",
    unfocused_text = "unfocusedtext",
    -- unfocused_text_opacity = "unfocusedtextopacity",
    unfocused_right_bound_text = "unfocusedrighttext",
    -- unfocused_right_bound_text_opacity = "unfocusedrighttextopacity",
    unfocused_texture = "unfocusedtexture",
    -- unfocused_texture_opacity = "unfocusedtextureopacity",
    hud = "hud",
    -- hud_opacity = "hudopacity",
    ar = "ar",
    -- ar_opacity = "aropacity",
    minigame = "minigame"
    -- minigame_opacity = "minigameopacity"
}

local position_commands = {
    x = "menux",
    y = "menuy"
}

local header_commands = {
    hide = "header hide"
}

local address_bar_commands = {
    state = "addressbar hide",
    height = "addressbarheight",
    text_scale = "addressbartextscale",
    text_x_offset = "addressbartextxoffset",
    text_y_offset = "addressbartextyoffset"
}

local cursor_commands = {
    scroll_gap = "cursorpadding",
    width = "cursorborderwidth",
    rounded = "cursorborderrounded",
    border = "cursorborder"
}

local tabs_commands = {
    state = "tabs",
    width = "tabswidth",
    height = "tabsheight",
    position = "tabsposition",
    text_scale = "tabstextscale",
    text_x_offset = "tabstextxoffset",
    text_y_offset = "tabstextyoffset",
    text_alignment = "tabsalignment",
    show_icon_left = "tabslefticon",
    show_name = "tabsname",
    show_icon_right = "tabsrighticon"
}

local scrollbar_commands = {
    width = "scrollbarwidth"
}

local command_info_text_commands = {
    position = "commandinfotextposition",
    width = "infowidth",
    padding = "infopadding",
    show_help_text = "showhelptext",
    show_command_syntax = "showsyntax",
    indicate_slider_behaviour = "showsliderbehaviour",
    indiciate_if_usable_by_other_players = "shownonuseronly"
}

local notification_commands = {
    x_position = "notifyx",
    y_position = "notifyy",
    width = "notifywidth",
    border = "notifyborder",
    flash = "notifyflash",
    background = "notifybg"
}

local commands_commands = {
    text_scale = "commandtextscale",
    text_x_offset = "commandtextxoffset",
    text_y_offset = "commandtextyoffset",
    number_sliders_selectable_na_sliders = "selectablenasliders",
    number_sliders_rightbound_value = "slidersrightbound",
    selectable_dividers = "selectabledividers"
}

local border_commands = {
    width = "borderwidth",
    rounded = "borderrounded",
    color = "border"
}

local other_commands = {
    max_visible_commands = "menuheight",
    list_width = "listwidth",
    list_height = "listheight",
    spacer_size = "spacersize",
    smooth_scroll = "smoothscroll",
    background_blur = "blur"
}

local font_commands = {
    command_box_input_text_scale = "commandboxinputscale",
    command_box_input_text_x_offset = "commandboxinputxoffset",
    command_box_input_text_y_offset = "commandboxinputyoffset",
    small_text_scale = "smalltextscale",
    small_text_x_offset = "smalltextxoffset",
    small_text_y_offset = "smalltextyoffset",
    show_text_bounding_boxes = "showtextboundingboxes"
}

local texture_commands = {
    leftbound = "lefttextures"
}

function load_json(json_path)
    local json_file = io.open(json_path, "r")
    local json_content = json_file:read "*a"

    local json = json.decode(json_content)
    json_file:close()

    return json
end

function read_json(json)
    local possible_keys = {"colors", "position", "header", "address_bar", "cursor", "tabs", "scrollbar",
                           "command_info_text", "notifications", "commands", "border", "other", "font_and_text",
                           "textures"}

    local key_commands_map = {
        colors = color_commands,
        position = position_commands,
        header = header_commands,
        address_bar = address_bar_commands,
        cursor = cursor_commands,
        tabs = tabs_commands,
        scrollbar = scrollbar_commands,
        command_info_text = command_info_text_commands,
        notifications = notification_commands,
        commands = commands_commands,
        border = border_commands,
        other = other_commands,
        font_and_text = font_commands,
        textures = texture_commands
    }

    for _, key in pairs(possible_keys) do
        if json[key] and key_commands_map[key] then
            for key_, command in pairs(key_commands_map[key]) do
                local value = json[key][key_]
                -- todo better impl
                if key == "address_bar" and key_ == "state" then
                    trigger_command(command)
                    if value == "enabled" then
                        trigger_command("addressbar")
                    end
                    goto continue
                end

                if key == "header" and key_ == "state" then
                    if value == "hide" then
                        trigger_command(key, value)
                    end
                    goto continue
                end

                trigger_command(command, value)
                ::continue::
            end
        end
    end

    trigger_command("clearstand")
    util.toast("Loaded " .. (json.name or "unknown theme"))
end

function trigger_command(command, args)
    if args then
        menu.trigger_commands(command .. " " .. args)
        return
    end

    menu.trigger_commands(command)
end

util.keep_running()
