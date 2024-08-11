-- path:   /home/klassiker/.local/share/repos/dotfiles/.config/mpv/scripts/menu_playlist.lua
-- author: klassiker [mrdotx]
-- github: https://github.com/mrdotx/dotfiles
-- date:   2024-08-10T07:04:55+0200

-- usage: mpv --script-opts=menu_playlist=1 playlist.m3u

-- key bindings
local keybinds = {
    binding_open      = {'\\'},
    binding_close     = {'ESC'},
    binding_up        = {'UP', 'MOUSE_BTN3'},
    binding_down      = {'DOWN', 'MOUSE_BTN4'},
    binding_page_up   = {'PGUP'},
    binding_page_down = {'PGDWN'},
    binding_select    = {'ENTER', 'MOUSE_BTN0'}
}

-- osd
local osd_time      = 10
local osd_font_size = 10

-- menu
local entries             = 24
local indicator_search    = "󰈲  "
local indicator_up        = ""
local indicator_down      = ""
local selected_active     = "│󰑐 "
local selected_inactive   = "│󰐊 "
local unselected_active   = "│󰐎 "
local unselected_inactive = "│  "

-- UTF-8 lower conversion
local utf8_uc_lc = {
    ["A"] = "a",
    ["B"] = "b",
    ["C"] = "c",
    ["D"] = "d",
    ["E"] = "e",
    ["F"] = "f",
    ["G"] = "g",
    ["H"] = "h",
    ["I"] = "i",
    ["J"] = "j",
    ["K"] = "k",
    ["L"] = "l",
    ["M"] = "m",
    ["N"] = "n",
    ["O"] = "o",
    ["P"] = "p",
    ["Q"] = "q",
    ["R"] = "r",
    ["S"] = "s",
    ["T"] = "t",
    ["U"] = "u",
    ["V"] = "v",
    ["W"] = "w",
    ["X"] = "x",
    ["Y"] = "y",
    ["Z"] = "z"
}

-- utf8 char pattern
local utf8_char = "[\1-\127\192-\223][\128-\191]*"

local chars = {}
for i = string.byte('a'), string.byte('z') do
    table.insert(chars, i)
end
for i = string.byte('A'), string.byte('Z') do
    table.insert(chars, i)
end
for i = string.byte('0'), string.byte('9') do
    table.insert(chars, i)
end
for _,v in ipairs({
            '`', '~',
            '!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
            '-', '_', '+', '=',
            '[', '{', ']', '}', '|',
            ';', ':', "'", '"',
            ',', '<', '.', '>',
            '?'
        }) do
    table.insert(chars, string.byte(v))
end

local pattern = ""
local timer
local is_active
local is_playlist_loaded

local keybinder = {
    remove = function(action)
        for i, _ in ipairs(keybinds[action]) do
            mp.remove_key_binding(action..tostring(i))
        end
    end,
    add = function(action, func, repeatable)
        for i, key in ipairs(keybinds[action]) do
            assert(type(func) == "function", "not a function")
            if repeatable then
                mp.add_forced_key_binding(key, action..tostring(i), func,
                    "repeatable")
            else
                mp.add_forced_key_binding(key, action..tostring(i), func)
            end
        end
    end
}

local playlister = {
    list,
    filtered,
    position,
    start,
    cursor,

    init = function(self)
        if not self.list then
            self.list = mp.get_property_native("playlist")
        end
        mp.commandv("stop")
        if self.list[1] then
            self.list[1].current = false
        end
        pattern = ""
        self.filtered = tablekeys(self.list)
    end,

    show = function(self)
        local i
        local msg

        if not self.filtered then
            return
        end
        if not self.start or not self.cursor then
            self.start = 1
            self.cursor = 0
        end

        msg = ""
        i = self.start
        local prefix
        while self.filtered[i] and i <= self.start + entries - 1 do
            if self.list[self.filtered[i]].current then
                prefix = unselected_active
            elseif i == self.start + self.cursor then
                prefix = selected_inactive
            else
                prefix = unselected_inactive
            end
            if self.list[self.filtered[i]].current
                    and i == self.start + self.cursor then
                prefix = selected_active
            end
            msg = msg..prefix..(self.list[self.filtered[i]].title or "").."\n"
            i = i + 1
        end
        if self.start > 1 then
            msg = indicator_up.."\n"..msg
        else
            msg = " \n"..msg
        end
        if self.start + entries - 1 < #self.filtered then
            msg = msg..indicator_down.."  "
        else
            msg = msg.."   "
        end
        msg = msg.."["..(self.start + self.cursor).."/"..#self.filtered.."]"
        msg = indicator_search..pattern.."\n"..msg
        mp.osd_message(mp.get_property_osd("osd-ass-cc/0")..
            "{\\fs"..osd_font_size.."}"..msg..
            mp.get_property_osd("osd-ass-cc/1"), osd_time)
    end,

    filter = function(self)
        self.filtered = {}
        for i, v in ipairs(self.list) do
            if string.match(mylower(v.title), '.*'..prepat(pattern)..'.*') then
                table.insert(self.filtered, i)
            end
        end
        self.start = 1
        self.cursor = 0
    end,

    down = function(self)
        if self.cursor >= #self.filtered - 1 then return end
        if self.cursor < entries - 1 then
            self.cursor = self.cursor + 1
        else
            if self.start < #self.filtered - entries + 1 then
                self.start = self.start + 1
            end
        end
        self.show(self)
    end,

    up = function(self)
        if self.cursor > 0 then
            self.cursor = self.cursor - 1
        else
            if self.start > 1 then
                self.start = self.start - 1
            end
        end
        self.show(self)
    end,

    page_down = function(self)
        if #self.filtered < entries then
            self.cursor = #self.filtered - 1
        else
            if self.start < #self.filtered - entries + 1 then
                self.start = self.start + entries
            else
                if self.start + self.cursor >= #self.filtered - entries + 1 then
                    self.cursor = entries - 1
                end
            end
            if self.start >= #self.filtered - entries + 1 then
                self.cursor = (#self.filtered
                    - self.start - self.cursor - entries + 1) * -1
                if self.cursor >= entries - 1 then
                    self.cursor = entries - 1
                end
                self.start = #self.filtered - entries + 1
            end
        end
        self.show(self)
    end,

    page_up = function(self)
        if self.start == 1 then
            self.cursor = 0
        else
            if self.start > 1 then
                self.start = self.start - entries
                if self.start < 1 then
                    self.cursor = self.start + self.cursor - 1
                    self.start = 1
                    if self.cursor < 1 then
                        self.cursor = 0
                    end
                end
            end
        end
        self.show(self)
    end,

    play = function(self)
        mp.commandv("loadfile",
            self.list[self.filtered[self.start + self.cursor]].filename)
        if self.position then
            self.list[self.position].current = false
        end
        self.position = self.filtered[self.start + self.cursor]
        self.list[self.position].current = true
    end
}

function add_bindings()
    keybinder.add("binding_close", shutdown)
    keybinder.add("binding_up", up, true)
    keybinder.add("binding_down", down, true)
    keybinder.add("binding_page_up", page_up, true)
    keybinder.add("binding_page_down", page_down, true)
    for i,v in ipairs(chars) do
        c = string.char(v)
        mp.add_forced_key_binding(c, 'search'..v, typing(c), "repeatable")
    end
    mp.add_forced_key_binding('SPACE', 'search32', typing(' '), "repeatable")

    mp.add_forced_key_binding('BS', 'searchbs', backspace, "repeatable")
    keybinder.add("binding_select", play)
end

function remove_bindings()
    keybinder.remove('binding_close')
    keybinder.remove('binding_up')
    keybinder.remove('binding_down')
    keybinder.remove('binding_page_up')
    keybinder.remove('binding_page_down')
    keybinder.remove('binding_select')
    for i, v in ipairs(chars) do
        c = string.char(v)
        mp.remove_key_binding('search'..v)
    end
    mp.remove_key_binding('search32')
    mp.remove_key_binding('searchbs')
end

function activate()
    if is_active then
        shutdown()
        return
    else
        is_active = true
        playlister:show()
        add_bindings()
        if not timer then
            timer = mp.add_periodic_timer(osd_time, shutdown)
            timer.oneshot = true
        else
            resumetimer()
        end
    end
end

function tablekeys(t)
  local result = {}
  for i, v in ipairs(t) do
    table.insert(result, i)
  end
  return result
end

function in_array(array, value)
    for _, v in ipairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

function mylower(s)
    local res, n = string.gsub(s, utf8_char, function (c)
                                    return utf8_uc_lc[c]
                                end)
    return res
end

function prepat(s)
    -- prepare nocase and magic chars
    s = string.gsub(s, "[%^%$%(%)%%%.%[%]%*%+%-%?]", function (c)
          return '%'..c
        end)
    return s
end

function resumetimer()
    timer:kill()
    timer:resume()
end

function typing(char)
    return function()
             local c = string.lower(char)
             pattern = pattern..c
             playlister:filter()
             playlister:show()
             resumetimer()
           end
end

function backspace()
    if string.len(pattern) > 0 then
        pattern = string.match(pattern, "(.*)"..utf8_char.."$")
        playlister:filter()
        playlister:show()
        resumetimer()
    end
end

function play()
    playlister:play()
    playlister:show()
    resumetimer()
end

function shutdown()
    remove_bindings()
    is_active = false
    mp.osd_message("", 1)
end

function down()
    playlister:down()
    resumetimer()
end

function up()
    playlister:up()
    resumetimer()
end

function page_down()
    playlister:page_down()
    resumetimer()
end

function page_up()
    playlister:page_up()
    resumetimer()
end

function on_start_file()
    if is_playlist_loaded then
        playlister:init()
        mp.unregister_event(on_start_file)
        activate()
    else
        is_playlist_loaded = true
    end
end

if mp.get_opt("menu_playlist") then
    mp.command("script-message osc-idlescreen no no_osd")
    mp.set_property_bool("idle", true)
    mp.set_property_bool("force-window", true)
    mp.register_event("start-file", on_start_file)
    keybinder.add("binding_open", activate)
end
