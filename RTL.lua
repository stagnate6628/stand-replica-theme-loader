root = menu.my_root()
script_dir = filesystem.scripts_dir() .. "RTL"
theme_dir = filesystem.stand_dir() .. "Theme"
themes_path = script_dir .. "\\themes.txt"

github_url = "raw.githubusercontent.com"
repo_url = "nealcaffrey259/stand-theme-loader/main/"

current_theme = ""

root:action("Restart script", {}, "", function()
    util:restart_script()
end)
root:action("Download themes file", {}, "", function()
    async_http.init(github_url, repo_url .. "themes.txt", function(themes_file)
        local file = io.open(themes_path, "wb")
        file:write(themes_file)
        file:close()
    end)
    async_http.dispatch()

    if filesystem.exists(themes_path) then
        util:restart_script()
    end
end)

root:divider("v1.0")

local theme = {
    name = "name",
    dirname = "name",
    position = {
        x = "0",
        y = "0"
    },
    color = {
        background = "000000",
        selected = "000000",
        focused = "000000",
        unfocused = "000000"
    },
    tabs = {
        state = "on",
        width = "0",
        height = "0",
        position = "top",
        text = {
            scale = "0",
            offsetx = "0",
            offsety = "0"
        },
        alignment = "centre"
    },
    text = {
        scale = "14",
        offset = {
            x = "0",
            y = "0"
        }
    },
    outline = {
        width = "0",
        color = "000000"
    },
    size = {
        width = "430",
        height = "0",
        options = "0",
        spacer = "0",
        scrollbar = "0",
        override = "430"
    }
}

local dx = {
    header = {
        state = "image",
        height = "0",
        offset = {
            x = "0",
            y = "0"
        },
        animated = false,
        frame_count = "0",
        delay = "0",
        restart_delay = "0"
    },
    overlay = {
        active = false
    },
    subheader = {
        active = false,
        height = "0"
    },
    footer = {
        active = false,
        height = "0"
    },
    activecursor = {
        active = false,
        anchor = "header",
        size = "0",
        offset = {
            x = "0",
            y = "0"
        },
        alignment = ALIGN_BOTTOM_LEFT,
        color = {
            r = "255",
            g = "255",
            b = "255"
        }
    },
    scrollbar = {
        active = false
    },
    border = {
        active = false,
        width = "0",
        color = {
            r = "255",
            g = "255",
            b = "255"
        }
    }
}

file = io.open(themes_path, "r")
themes_from_file = {}

for line in file:lines() do
    table.insert(themes_from_file, line)
end

theme_selector = menu.action_slider(menu.my_root(), "Theme Selector", {}, "", themes_from_file, function(_, value)
    if current_theme ~= value then
        current_theme = value
    else
        menu.show_warning(theme_selector, 1,
            "It appears you are already using the selected theme. You can force the download if you aren't.", function()
                current_theme = value
            end)
    end

    pluto_switch value do
       case "2Take1":
            theme = {
                name = "2Take1",
                dirname = "2Take1",
                position = {
                    x = "1220",
                    y = "220"
                },
                color = {
                    background = "00000096",
                    selected = "FFFFFFFF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "on",
                    width = "69",
                    height = "44",
                    position = "top",
                    text = {
                        scale = "15",
                        offsetx = "-2",
                        offsety = "9"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "13",
                    offset = {
                        x = "1",
                        y = "10"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "483",
                    height = "46",
                    options = "10",
                    spacer = "0",
                    scrollbar = "0",
                    override = "483"
                },
            }
            dx = {
                header = {
                    state = "image",
                    height = "83",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = false,
                    height = "0"
                },
                footer = {
                    active = true,
                    height = "31"
                },
                activecursor = {
                    active = false,
                    anchor = "header",
                    size = "0",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    alignment = ALIGN_BOTTOM_LEFT,
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Impulse":
            theme = {
                name = "Impulse",
                dirname = "Impulse",
                position = {
                    x = "80",
                    y = "200"
                },
                color = {
                    background = "060A14C8",
                    selected = "1DA1A5FF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "14",
                    offset = {
                        x = "2",
                        y = "6"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "450",
                    height = "33",
                    options = "15",
                    spacer = "12",
                    scrollbar = "15",
                    override = "450"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "111",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = true,
                    frame_count = "50",
                    delay = "0.05",
                    restart_delay = "1"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "35"
                },
                footer = {
                    active = true,
                    height = "37"
                },
                activecursor = {
                    active = true,
                    anchor = "footer",
                    size = "12",
                    offset = {
                        x = "-7",
                        y = "5"
                    },
                    alignment = ALIGN_BOTTOM_LEFT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = true
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Paragon":
            theme = {
                name = "Paragon",
                dirname = "Paragon",
                position = {
                    x = "60",
                    y = "226"
                },
                color = {
                    background = "1E1E20FF",
                    selected = "56595BFF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "14",
                    offset = {
                        x = "1",
                        y = "8"
                    }
                },
                outline = {
                    width = "2",
                    color = "4995EDFF"
                },
                size = {
                    width = "508",
                    height = "38",
                    options = "16",
                    spacer = "0",
                    scrollbar = "0",
                    override = "508"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "128",
                    offset = {
                        x = "2",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "38"
                },
                footer = {
                    active = true,
                    height = "38"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "13",
                    offset = {
                        x = "-498",
                        y = "9"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = true,
                    width = "2",
                    color = {
                        r = "72",
                        g = "148",
                        b = "234"
                    }
                }
            }
       break
       case "Luna":
            theme = {
                name = "Luna",
                dirname = "Luna",
                position = {
                    x = "180",
                    y = "220"
                },
                color = {
                    background = "000000C8",
                    selected = "FFFFFFFF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "13",
                    offset = {
                        x = "-1",
                        y = "7"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "440",
                    height = "32",
                    options = "12",
                    spacer = "0",
                    scrollbar = "0",
                    override = "440"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "125",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "34"
                },
                footer = {
                    active = true,
                    height = "34"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "12",
                    offset = {
                        x = "-432",
                        y = "7"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Kiddions":
            theme = {
                name = "Kiddions",
                dirname = "Kiddions",
                position = {
                    x = "240",
                    y = "40"
                },
                color = {
                    background = "304C5BF0",
                    selected = "DBCA7FFF",
                    focused = "50575BFF",
                    unfocused = "F2F2F2FF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "12",
                    offset = {
                        x = "0",
                        y = "-2"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "350",
                    height = "21",
                    options = "40",
                    spacer = "0",
                    scrollbar = "0",
                    override = "350"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "20",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = false,
                    height = "0"
                },
                footer = {
                    active = false,
                    height = "0"
                },
                activecursor = {
                    active = false,
                    anchor = "header",
                    size = "0",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Ozark":
            theme = {
                name = "Ozark",
                dirname = "Interaction",
                position = {
                    x = "215",
                    y = "315"
                },
                color = {
                    background = "000000B4",
                    selected = "FFFFFFFF",
                    focused = "000000FF",
                    unfocused = "FFFFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "14",
                    offset = {
                        x = "1",
                        y = "7"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "432",
                    height = "38",
                    options = "10",
                    spacer = "0",
                    scrollbar = "0",
                    override = "432"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "108",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = true,
                    frame_count = "18",
                    delay = "0.05",
                    restart_delay = "8",
                    interaction_header = true
                },
                overlay = {
                    active = true
                },
                subheader = {
                    active = true,
                    height = "37"
                },
                footer = {
                    active = false,
                    height = "0"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "14",
                    offset = {
                        x = "-422",
                        y = "7"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Phantom-X":
            theme = {
                name = "Phantom-X",
                dirname = "Phantom-X",
                position = {
                    x = "190",
                    y = "290"
                },
                color = {
                    background = "000000C8",
                    selected = "6A6280",
                    focused = "000000FF",
                    unfocused = "FFFFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "17",
                    offset = {
                        x = "0",
                        y = "5"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "458",
                    height = "34",
                    options = "15",
                    spacer = "12",
                    scrollbar = "15",
                    override = "458"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "98",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "31"
                },
                footer = {
                    active = true,
                    height = "31"
                },
                activecursor = {
                    active = true,
                    anchor = "footer",
                    size = "14",
                    offset = {
                        x = "-6",
                        y = "8"
                    },
                    alignment = ALIGN_BOTTOM_LEFT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = true
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Fragment":
            theme = {
                name = "Fragment",
                dirname = "Fragment",
                position = {
                    x = "320",
                    y = "440"
                },
                color = {
                    background = "030003D2",
                    selected = "FFFFFFFF",
                    focused = "000000FF",
                    unfocused = "FFFFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "11",
                    offset = {
                        x = "2",
                        y = "5"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "384",
                    height = "28",
                    options = "13",
                    spacer = "0",
                    scrollbar = "0",
                    override = "384"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "70",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "59"
                },
                footer = {
                    active = true,
                    height = "59"
                },
                activecursor = {
                    active = false,
                    anchor = "footer",
                    size = "0",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    alignment = ALIGN_BOTTOM_LEFT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Rebound":
            theme = {
                name = "Rebound",
                dirname = "Rebound",
                position = {
                    x = "150",
                    y = "230"
                },
                color = {
                    background = "00000096",
                    selected = "FF783AFF",
                    focused = "000000FF",
                    unfocused = "FFFFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "14",
                    offset = {
                        x = "1",
                        y = "7"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "460",
                    height = "35",
                    options = "12",
                    spacer = "0",
                    scrollbar = "0",
                    override = "460"
            }
            }
            dx = {
                header = {
                    state = "image",
                    height = "102",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "35"
                },
                footer = {
                    active = true,
                    height = "35"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "14",
                    offset = {
                        x = "-450",
                        y = "7"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "X-Force":
            theme = {
                name = "X-Force",
                dirname = "X-Force",
                position = {
                    x = "1240",
                    y = "350"
                },
                color = {
                    background = "00000096",
                    selected = "35896CFF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "13",
                    offset = {
                        x = "2",
                        y = "5"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "504",
                    height = "31",
                    options = "14",
                    spacer = "0",
                    scrollbar = "0",
                    override = "504"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "122",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "31"
                },
                footer = {
                    active = true,
                    height = "31"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "12",
                    offset = {
                        x = "-492",
                        y = "7"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Circuit":
            theme = {
                name = "Circuit",
                dirname = "Circuit",
                position = {
                    x = "32",
                    y = "165"
                },
                color = {
                    background = "000000C8",
                    selected = "606060FF",
                    focused = "000000FF",
                    unfocused = "AAAAAAFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "13",
                    offset = {
                        x = "-1",
                        y = "4"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "412",
                    height = "31",
                    options = "13",
                    spacer = "0",
                    scrollbar = "0",
                    override = "408"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "101",
                    offset = {
                        x = "2",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "34"
                },
                footer = {
                    active = true,
                    height = "35"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "12",
                    offset = {
                        x = "-400",
                        y = "9"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "191",
                        g = "191",
                        b = "191"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = true,
                    width = "2",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Terror":
            theme = {
                name = "Terror",
                dirname = "Terror",
                position = {
                    x = "32",
                    y = "165"
                },
                color = {
                    background = "000000C8",
                    selected = "C1010196",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "22",
                    offset = {
                        x = "-1",
                        y = "3"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "442",
                    height = "38",
                    options = "17",
                    spacer = "0",
                    scrollbar = "0",
                    override = "442"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "91",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "39"
                },
                footer = {
                    active = true,
                    height = "39"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "24",
                    offset = {
                        x = "-400",
                        y = "9"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "XCheats":
            theme = {
                name = "XCheats",
                dirname = "XCheats",
                position = {
                    x = "1430",
                    y = "160"
                },
                color = {
                    background = "000000E1",
                    selected = "6F7375FF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "14",
                    offset = {
                        x = "-1",
                        y = "8"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "370",
                    height = "36",
                    options = "10",
                    spacer = "0",
                    scrollbar = "0",
                    override = "365"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "85",
                    offset = {
                        x = "3",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = true,
                    height = "30"
                },
                footer = {
                    active = true,
                    height = "30"
                },
                activecursor = {
                    active = true,
                    anchor = "header",
                    size = "12",
                    offset = {
                        x = "-355",
                        y = "4"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = true,
                    width = "3",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Serendipity":
            theme = {
                name = "Serendipity",
                dirname = "Serendipity",
                position = {
                    x = "1302",
                    y = "190"
                },
                color = {
                    background = "00000000",
                    selected = "000000",
                    focused = "FFFFFF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "20",
                    offset = {
                        x = "-3",
                        y = "1"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "479",
                    height = "30",
                    options = "23",
                    spacer = "0",
                    scrollbar = "0",
                    override = "469"
                }
            }
            dx = {
                header = {
                    state = "background",
                    height = "928",
                    offset = {
                        x = "5",
                        y = "120"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = false,
                    height = "0"
                },
                footer = {
                    active = false,
                    height = "0"
                },
                activecursor = {
                    active = false,
                    anchor = "header",
                    size = "0",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "Epsilon":
            log("you selected epsilon")
            
            theme = {
                name = "Epsilon",
                dirname = "Interaction",
                position = {
                    x = "1360",
                    y = "195"
                },
                color = {
                    background = "00000096",
                    selected = "FFFFFFFF",
                    focused = "000000FF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "14",
                    offset = {
                        x = "0",
                        y = "5"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "432",
                    height = "30",
                    options = "15",
                    spacer = "0",
                    scrollbar = "0",
                    override = "432"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "108",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = true,
                    frame_count = "18",
                    delay = "0.05",
                    restart_delay = "8",
                    interaction_header = true
                },
                overlay = {
                    active = true
                },
                subheader = {
                    active = true,
                    height = "28"
                },
                footer = {
                    active = true,
                    height = "30"
                },
                activecursor = {
                    active = false,
                    anchor = "header",
                    size = "0",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       case "The Purge":
            theme = {
                name = "The Purge",
                dirname = "The Purge",
                position = {
                    x = "1300",
                    y = "335"
                },
                color = {
                    background = "1E1E1EFF",
                    selected = "FF0000FF",
                    focused = "FFFFFF",
                    unfocused = "FFFFFF"
                },
                tabs = {
                    state = "off",
                    width = "0",
                    height = "0",
                    position = "top",
                    text = {
                        scale = "0",
                        offsetx = "0",
                        offsety = "0"
                    },
                    alignment = "centre"
                },
                text = {
                    scale = "13",
                    offset = {
                        x = "2",
                        y = "5"
                    }
                },
                outline = {
                    width = "0",
                    color = "000000"
                },
                size = {
                    width = "441",
                    height = "35",
                    options = "17",
                    spacer = "0",
                    scrollbar = "0",
                    override = "441"
                }
            }
            dx = {
                header = {
                    state = "image",
                    height = "56",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    animated = false,
                    frame_count = "0",
                    delay = "0",
                    restart_delay = "0"
                },
                overlay = {
                    active = false
                },
                subheader = {
                    active = false,
                    height = "0"
                },
                footer = {
                    active = false,
                    height = "0"
                },
                activecursor = {
                    active = false,
                    anchor = "header",
                    size = "0",
                    offset = {
                        x = "0",
                        y = "0"
                    },
                    alignment = ALIGN_BOTTOM_RIGHT,
                    color = {
                        r = "255",
                        g = "255",
                        b = "255"
                    }
                },
                scrollbar = {
                    active = false
                },
                border = {
                    active = false,
                    width = "0",
                    color = {
                        r = "0",
                        g = "0",
                        b = "0"
                    }
                }
            }
       break
       default:
            log("Could not find any assets for the selected theme.")
       break
    end

    -- this should almost always fire
    if table.contains(themes_from_file, value) then
        log("Starting download of " .. value .. " assets")
        download_theme(theme, dx)
        use_theme(theme.name)
    end
end)

root:action("Reset theme", {}, "", function()
    use_default_theme()
    log("I have reset to the default scheme as best as possible.")
end)

function download_file(url_path, file_path, log_msg) 
    async_http.init(github_url, repo_url .. url_path, function(file_)
        local file = io.open(file_path, "wb")
        file:write(file_)
        file:close()

        if log_msg ~= nil then
            log(log_msg)
        end
    end)
    async_http.dispatch()
end

-- todo check if assets from git exists (git api?)
function download_theme(theme, dx)
    local name = theme.name

    if not filesystem.exists(script_dir .. "\\" .. name) then
        filesystem.mkdir(script_dir .. "\\" .. name)
    end

    if not dx.header.animated and dx.header.frame_count == "0" then
        download_file(name .. "/Header" .. ".bmp", script_dir .. "\\" .. name .. "\\Header" .. ".bmp", "Downloaded header")
    else
        if not dx.header.interaction_header then
            for i = 1, dx.header.frame_count do
                local done = false
                async_http.init(github_url, repo_url .. name .. "/Header" .. i .. ".bmp", function(header_file)
                    local file = io.open(script_dir .. "\\" .. name .. "\\Header" .. i .. ".bmp", "wb")
                    file:write(header_file)
                    file:close()
                    done = true
                    log("Downloaded header " .. i .. " of " .. dx.header.frame_count)
                end)
                async_http.dispatch()
    
                repeat
                    util.yield()
                until done
            end
        end
    end

    if dx.subheader.active then
        download_file(name .. "/Subheader" .. ".bmp", script_dir .. "\\" .. name .. "\\Subheader" .. ".bmp", "Downloaded subheader")
    end

    if dx.header.interaction_header then
        local header_path = script_dir .. "\\" .. "\\.interaction\\"
        if not filesystem.exists(header_path) then
            filesystem.mkdir(header_path)
        end

        local missing = false
        --  there is probably a better way to do this
        for i, path in ipairs(filesystem.list_files(header_path)) do
            if not filesystem.exists(header_path .. "Header1.bmp") then
                missing = true
                break
            end
        end

        if missing then
            for i = 1, 18 do
                local done = false
                download_file(name .. "/Interaction/" .. "Header" .. i .. ".bmp", header_path .. "Header" .. i .. ".bmp")
               
                repeat
                    util.yield()
                until done
            end
        end
    end

    -- this seems to only be for "interaction-menu" themes
    if dx.overlay.active then
        download_file(name .. "/Overlay" .. ".bmp", script_dir .. "\\" .. name .. "\\Overlay" .. ".bmp", "Downloading overlay")
    end

    if dx.footer.active then
        download_file(name .. "/Footer" .. ".bmp", script_dir .. "\\" .. name .. "\\Footer" .. ".bmp", "Downloading footer")
    end

    -- textures/fonts are done like this b/c they reload more consistently
    async_http.init(github_url, repo_url .. name .. "/List" .. ".png", function(list_icon)
        local file = io.open(theme_dir .. "\\List.png", "wb")
        file:write(list_icon)
        file:close()
        menu.trigger_commands("reloadtextures")
        log("Downloading list icon")
    end)
    async_http.dispatch()

    async_http.init(github_url, repo_url .. name .. "/On" .. ".png", function(toggle_on_icon)
        local file = io.open(theme_dir .. "\\Toggle On.png", "wb")
        file:write(toggle_on_icon)
        file:close()
        menu.trigger_commands("reloadtextures")
        log("Downloading toggle on icon")
    end)
    async_http.dispatch()

    async_http.init(github_url, repo_url .. name .. "/Off" .. ".png", function(toggle_off_icon)
        local file = io.open(theme_dir .. "\\Toggle Off.png", "wb")
        file:write(toggle_off_icon)
        file:close()
        menu.trigger_commands("reloadtextures")
        log("Downloading toggle off icon")
    end)
    async_http.dispatch()

    async_http.init(github_url, repo_url .. name .. "/Font" .. ".spritefont", function(toggle_off_icon)
        local file = io.open(theme_dir .. "\\Font.spritefont", "wb")
        file:write(toggle_off_icon)
        file:close()
        menu.trigger_commands("reloadfont")
        log("Downloading font")
    end)
    async_http.dispatch()

    -- download_file(name .. "/List" .. ".png", theme_dir .. "\\List.png", "Downloading list icon")
    -- download_file(name .. "/On" .. ".png", theme_dir .. "\\Toggle On.png", "Downloading toggle on icon")
    -- download_file(name .. "/Off" .. ".png", theme_dir .. "\\Toggle Off.png", "Downloading toggle off icon")
    -- download_file(name .. "/Font" .. ".spritefont", theme_dir .. "\\Font.spritefont", "Downloading font")
end

function use_theme(name)
    menu.trigger_commands("menux " .. theme.position.x .. "; menuy " .. theme.position.y)
    menu.trigger_commands("background " .. theme.color.background .. "; primary " .. theme.color.selected ..
                              "; focustext " .. theme.color.focused .. "; focusrighttext " .. theme.color.focused ..
                              "; focustexture " .. theme.color.focused .. "; unfocusedtext " .. theme.color.unfocused ..
                              "; unfocusedrighttext " .. theme.color.unfocused .. "; unfocusedtexture " ..
                              theme.color.unfocused)
    menu.trigger_commands("tabs " .. theme.tabs.state .. "; tabswidth " .. theme.tabs.width .. "; tabsheight " ..
                              theme.tabs.height .. "; tabsposition " .. theme.tabs.position .. "; tabstextscale " ..
                              theme.tabs.text.scale .. "; tabstextxoffset " .. theme.tabs.text.offsetx ..
                              "; tabstextyoffset " .. theme.tabs.text.offsety .. "; tabsalignment " ..
                              theme.tabs.alignment)
    menu.trigger_commands("commandtextscale " .. theme.text.scale .. "; commandtextxoffset " .. theme.text.offset.x ..
                              "; commandtextyoffset " .. theme.text.offset.y)
    menu.trigger_commands("cursorborderwidth " .. theme.outline.width .. "; cursorborder " .. theme.outline.color)
    menu.trigger_commands("listwidth " .. theme.size.width .. "; listheight " .. theme.size.height .. "; menuheight " ..
                              theme.size.options .. "; spacersize " .. theme.size.spacer .. "; scrollbar " ..
                              theme.size.scrollbar .. "; listwidth " .. theme.size.override)
    menu.trigger_commands(
        "borderwidth 0; blur 0; header hide; showhelptext off; showsyntax off; showsliderbehaviour off; shownonuseronly off")
        
    menu.trigger_command(menu.ref_by_path("Stand>Settings>Appearance>Scrollbar>Scrollbar>" ..
                                              (dx.scrollbar.active == false and "Disabled" or "Enabled")))
    menu.trigger_commands("addressbar hide; " .. (name == "Stand" and "addressbar;" or "") .. "clearstandnotifys;") 
    menu.trigger_command(menu.ref_by_path("Stand>Lua Scripts>RTL"))

    if dx.header.animated then
        local dir = if dx.header.interaction_header then "\\.interaction" else "\\" .. theme.name
        directx.create_texture(script_dir .. dir .. "\\Header1.bmp")
    else
        headerDX = directx.create_texture(script_dir .. "\\" .. theme.dirname .. "\\Header.bmp")
    end

    if dx.overlay.active then
        overlayDX = directx.create_texture(script_dir .. "\\" .. theme.name .. "\\Overlay.bmp")
    end

    if dx.subheader.active then
        subheaderDX = directx.create_texture(script_dir .. "\\" .. theme.name .. "\\Subheader.bmp")
    end

    if dx.footer.active then
        footerDX = directx.create_texture(script_dir .. "\\" .. theme.name .. "\\Footer.bmp")
    end

    util.create_tick_handler(function()
        if theme.name ~= name then
            return false
        end

        position_x, position_y, list_width, list_height = menu.get_main_view_position_and_size()
        activecursorDX = menu.get_active_list_cursor_text(true, true)

        if menu.is_open() then
            if dx.border.active == true then
                directx.draw_rect(position_x - dx.header.offset.x / 1920, position_y, dx.border.width / 1920,
                    list_height, dx.border.color.r / 255, dx.border.color.g / 255, dx.border.color.b / 255, 1)
                directx.draw_rect(position_x + list_width, position_y, dx.border.width / 1920, list_height,
                    dx.border.color.r / 255, dx.border.color.g / 255, dx.border.color.b / 255, 1)
            end

            if dx.header.state == "image" then
                if dx.header.animated == true then
                    directx.draw_texture(headersDX, 1, (dx.header.height / 1080) / 2, 0, 0,
                        position_x - dx.header.offset.x / 1920,
                        (position_y - (dx.header.height + dx.subheader.height) / 1080) - (theme.tabs.height / 1080) -
                            (dx.header.offset.y / 1080), 0, 1, 1, 1, 1)
                else
                    directx.draw_texture(headerDX, 1, (dx.header.height / 1080) / 2, 0, 0,
                        position_x - dx.header.offset.x / 1920,
                        (position_y - (dx.header.height + dx.subheader.height) / 1080) - (theme.tabs.height / 1080) -
                            (dx.header.offset.y / 1080), 0, 1, 1, 1, 1)
                end
            elseif dx.header.state == "background" then
                directx.draw_texture(headerDX, (theme.size.width / 3840), (dx.header.height / 3840), 0, 0,
                    position_x - (dx.header.offset.x / 1920), position_y - (dx.header.offset.y / 1080), 0, 1, 1, 1, 1)
            end

            if dx.overlay.active == true then
                directx.draw_texture(overlayDX, 1, (dx.header.height / 1080) / 2, 0, 0,
                    position_x - dx.header.offset.x / 1920,
                    (position_y - (dx.header.height + dx.subheader.height) / 1080) - (theme.tabs.height / 1080) -
                        (dx.header.offset.y / 1080), 0, 1, 1, 1, 1)
            end

            if dx.subheader.active == true then
                directx.draw_texture(subheaderDX, 1, (dx.subheader.height / 1080) / 2, 0, 0,
                    position_x - dx.header.offset.x / 1920, (position_y - dx.subheader.height / 1080) -
                        (theme.tabs.height / 1080) - (dx.header.offset.y / 1080), 0, 1, 1, 1, 1)
            end

            if dx.footer.active == true then
                directx.draw_texture(footerDX, 1, (dx.footer.height / 1080) / 2, 0, 0,
                    position_x - dx.header.offset.x / 1920, (position_y + list_height - (1 / 1080)), 0, 1, 1, 1, 1)
            end

            if dx.activecursor.active == true then
                if dx.activecursor.anchor == "header" then
                    directx.draw_text(position_x - dx.activecursor.offset.x / 1920,
                        position_y - dx.activecursor.offset.y / 1080, activecursorDX, dx.activecursor.alignment,
                        (dx.activecursor.size / 11) / 2, dx.activecursor.color.r / 255, dx.activecursor.color.g / 255,
                        dx.activecursor.color.b / 255, 1)
                end

                if dx.activecursor.anchor == "footer" then
                    directx.draw_text(position_x - dx.activecursor.offset.x / 1920, (position_y + list_height +
                        (theme.size.height / 1080)) - dx.activecursor.offset.y / 1080, activecursorDX,
                        dx.activecursor.alignment, (dx.activecursor.size / 11) / 2, dx.activecursor.color.r / 255,
                        dx.activecursor.color.g / 255, dx.activecursor.color.b / 255, 1)
                end

            end
        end
    end)

    if dx.header.animated then
        util.create_tick_handler(function()
            if theme.name ~= name then
                return false
            end
    
            for i = 1, dx.header.frame_count do
                if theme.name ~= name then
                    return false
                end

                util.yield(dx.header.delay * 1000)
                if not dx.header.interaction_header then
                    headersDX = directx.create_texture(script_dir .. "\\" .. name .. "\\Header" .. i .. ".bmp")
                else 
                    headersDX = directx.create_texture(script_dir .. "\\.interaction" .. "\\Header" .. i .. ".bmp")
                end
            end

            util.yield(dx.header.restart_delay * 1000)
        end)
    end
end

function use_default_theme()
    theme = {
        name = "Stand",
        dirname = "Stand",
        position = {
            x = "1325",
            y = "560"
        },
        color = {
            background = "00000066",
            selected = "FF00FF",
            focused = "FFFFFF",
            unfocused = "FFFFFF"
        },
        tabs = {
            state = "on",
            width = "110",
            height = "32",
            position = "left",
            text = {
                scale = "15",
                offsetx = "-2",
                offsety = "3"
            },
            alignment = "left"
        },
        text = {
            scale = "15",
            offset = {
                x = "-2",
                y = "2"
            }
        },
        outline = {
            width = "0",
            color = "000000"
        },
        size = {
            width = "450",
            height = "32",
            options = "11",
            spacer = "3",
            scrollbar = "6",
            override = "450"
        }
    }
    dx = {
        header = {
            state = "off",
            height = "0",
            offset = {
                x = "0",
                y = "0"
            },
            animated = false,
            frame_count = "0",
            delay = "0",
            restart_delay = "0"
        },
        overlay = {
            active = false
        },
        subheader = {
            active = false,
            height = "0"
        },
        footer = {
            active = false,
            height = "0"
        },
        activecursor = {
            active = false,
            anchor = "header",
            size = "0",
            offset = {
                x = "0",
                y = "0"
            },
            alignment = ALIGN_BOTTOM_LEFT,
            color = {
                r = "0",
                g = "0",
                b = "0"
            }
        },
        scrollbar = {
            active = true
        },
        border = {
            active = false,
            width = "0",
            color = {
                r = "0",
                g = "0",
                b = "0"
            }
        }
    }
    download_theme(theme, dx)
    use_theme(theme.name)
end

function log(msg) 
    util.toast("[" .. theme.name .. "] " .. msg, TOAST_CONSOLE)
end

util.keep_running()
