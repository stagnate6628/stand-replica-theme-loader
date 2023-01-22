menu.divider(menu.my_root(), "Downloading assets...")

local dataset = {"2Take1-Footer", "2Take1-Header", "Circuit-Footer", "Circuit-Header", "Circuit-Subheader",
                 "Epsilon-Footer", "Epsilon-Overlay", "Epsilon-Subheader", "Fragment-Footer", "Fragment-Header",
                 "Fragment-Subheader", "Impulse-Footer", "Luna-Footer", "Luna-Header", "Luna-Subheader",
                 "Ozark-Overlay", "Ozark-Subheader", "Paragon-Footer", "Paragon-Header", "Paragon-Subheader",
                 "Phantom-X-Footer", "Phantom-X-Header", "Phantom-X-Subheader", "Rebound-Footer", "Rebound-Header",
                 "Rebound-Subheader", "Serendipity-Header", "Terror-Footer", "Terror-Header", "Terror-Subheader",
                 "The Purge-Header", "UniversalScrollbar", "X-Force-Footer", "X-Force-Header", "X-Force-Subheader",
                 "XCheats-Footer", "XCheats-Header", "XCheats-Subheader", "Impulse-Subheader", "Kiddions-Header"}

filesystem.mkdir(filesystem.scripts_dir() .. "RTL/")
util.toast("Created directory")

for i = 1, 40 do
    local Completed = false

    async_http.init("raw.githubusercontent.com", "ukn-repos/rtl/main/assembler/" .. dataset[i] .. ".bmp",
        function(createfile)
            file = io.open(filesystem.scripts_dir() .. "RTL/" .. dataset[i] .. ".bmp", "wb")
            file:write(createfile)
            file:close()
            util.toast("(" .. i .. ") Imported " .. dataset[i] .. " !")
            Completed = true
        end)
    async_http.dispatch()

    repeat
        util.yield()
    until Completed
end

for i = 1, 50 do -- impulse
    local Completed = false

    async_http.init("raw.githubusercontent.com", "ukn-repos/rtl/main/assembler/Impulse-Header" .. i .. ".bmp",
        function(createfile)
            file = io.open(filesystem.scripts_dir() .. "RTL/Impulse-Header" .. i .. ".bmp", "wb")
            file:write(createfile)
            file:close()
            util.toast("Imported Impulse Header " .. i .. " !")
            Completed = true
        end)
    async_http.dispatch()

    repeat
        util.yield()
    until Completed
end

for i = 1, 18 do -- interaction
    local Completed = false

    async_http.init("raw.githubusercontent.com", "ukn-repos/rtl/main/assembler/Interaction-Header" .. i .. ".bmp",
        function(createfile)
            file = io.open(filesystem.scripts_dir() .. "RTL/Interaction-Header" .. i .. ".bmp", "wb")
            file:write(createfile)
            file:close()
            util.toast("Imported Interaction Header " .. i .. " !")
            Completed = true
        end)
    async_http.dispatch()

    repeat
        util.yield()
    until Completed
end

async_http.init("raw.githubusercontent.com", "ukn-repos/rtl/main/RTL.lua", function(update)
    source = io.open(filesystem.scripts_dir() .. SCRIPT_RELPATH, "wb")
    source:write(update)
    source:close()
    util.restart_script()
end)
async_http.dispatch()
