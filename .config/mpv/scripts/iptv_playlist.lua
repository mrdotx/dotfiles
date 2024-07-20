-- path:   /home/klassiker/.local/share/repos/dotfiles/.config/mpv/scripts/iptv_playlist.lua
-- author: klassiker [mrdotx]
-- github: https://github.com/mrdotx/dotfiles
-- date:   2024-07-20T05:35:13+0200

-- usage: mpv --script-opts=iptv=1 playlist.m3u

-- key bindings
local keybinds = {
    activate = {'\\', 'MOUSE_BTN2'},
    plsup    = {'UP', 'MOUSE_BTN3'},
    plsdown  = {'DOWN', 'MOUSE_BTN4'},
    plsenter = {'ENTER', 'MOUSE_BTN0'}
}

-- osd
local osd_time = 5

-- playlist entries
local entries = 20

-- favorites on top of the playlist
local favorites = {}

-- formatting / cursors
local indicator_search        = "󰈲  "
local indicator_up            = ""
local indicator_down          = ""
local selected_and_active     = "│󰑐 "
local selected_and_inactive   = "│󰐊 "
local unselected_and_active   = "│󰐎 "
local unselected_and_inactive = "│  "

local pattern = ""
local timer
local is_active
local is_playlist_loaded

-- UTF-8 lower/upper conversion
local utf8_lc_uc = {
    ["a"] = "A",
    ["b"] = "B",
    ["c"] = "C",
    ["d"] = "D",
    ["e"] = "E",
    ["f"] = "F",
    ["g"] = "G",
    ["h"] = "H",
    ["i"] = "I",
    ["j"] = "J",
    ["k"] = "K",
    ["l"] = "L",
    ["m"] = "M",
    ["n"] = "N",
    ["o"] = "O",
    ["p"] = "P",
    ["q"] = "Q",
    ["r"] = "R",
    ["s"] = "S",
    ["t"] = "T",
    ["u"] = "U",
    ["v"] = "V",
    ["w"] = "W",
    ["x"] = "X",
    ["y"] = "Y",
    ["z"] = "Z"
}

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
for i = string.byte('a'),string.byte('z') do
    table.insert(chars,i)
end
for i = string.byte('A'),string.byte('Z') do
    table.insert(chars,i)
end
for i = string.byte('0'),string.byte('9') do
    table.insert(chars,i)
end
for _,v in ipairs({
            ',',
            '^',
            '$',
            '(',
            ')',
            '%',
            '.',
            '[',
            ']',
            '*',
            '+',
            '-',
            '?',
            '`',
            "'",
            ';'
        }) do
    table.insert(chars,string.byte(v))
end

local keybinder = {
    remove = function(action)
        for i,_ in ipairs(keybinds[action]) do
            mp.remove_key_binding(action..tostring(i))
        end
    end,
    add = function(action, func, repeatable)
        for i,key in ipairs(keybinds[action]) do
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
    pls,
    plsfiltered,
    plspos,
    wndstart,
    wndend,
    cursor,

    init = function(self)
        if not self.pls then
            self.pls = mp.get_property_native("playlist")
        end
        mp.commandv("stop")
        -- need to mark first entry non-current (mpv bug?)
        if self.pls[1] then
            self.pls[1].current = false
        end
        if favorites and #favorites > 0 then
            self:sortfavs()
        end
        pattern = ""
        self.plsfiltered = tablekeys(self.pls)
    end,

    show = function(self)
        local i
        local newpos
        local msg

        if not self.plsfiltered then
            return
        end
        if not self.wndstart or not self.cursor then
            self.wndstart = 1
            self.cursor = 0
        end

        mp.command("script-message osc-idlescreen no no_osd")

        msg = ""
        i = self.wndstart
        local prefix
        while self.plsfiltered[i] and i <= self.wndstart + entries - 1 do
            if self.pls[self.plsfiltered[i]].current then
                prefix = unselected_and_active
            elseif i == self.wndstart + self.cursor then
                prefix = selected_and_inactive
            else
                prefix = unselected_and_inactive
            end
            if self.pls[self.plsfiltered[i]].current
                    and i == self.wndstart + self.cursor then
                prefix = selected_and_active
            end
            msg = msg..prefix..(self.pls[self.plsfiltered[i]].title or "").."\n"
            i = i + 1
        end
        if self.wndstart > 1 then
            msg = indicator_up.."\n"..msg
        else
            msg = " \n"..msg
        end
        if self.wndstart + entries - 1 < #self.plsfiltered then
            msg = msg..indicator_down
        end
        msg = indicator_search..pattern.."\n"..msg
        mp.osd_message(msg, osd_time)
    end,

    sortfavs = function(self)
        -- favorites on top
        local favs = {}
        local nonfavs = {}
        for _,v in ipairs(self.pls) do
            if in_array(favorites,v.title) then
                favs[#favs + 1] = v
            else
                nonfavs[#nonfavs + 1] = v
            end
        end
        for i = 1,#nonfavs do
            favs[#favs + 1] = nonfavs[i]
        end
        self.pls = favs
    end,

    filter = function(self)
        self.plsfiltered = {}
        for i,v in ipairs(self.pls) do
            if string.match(mylower(v.title),'.*'..prepat(pattern)..'.*') then
                table.insert(self.plsfiltered,i)
            end
        end
        self.wndstart = 1
        self.cursor = 0
    end,

    down = function(self)
        if self.cursor >= #self.plsfiltered - 1 then return end
        if self.cursor < entries - 1 then
            self.cursor = self.cursor + 1
        else
            if self.wndstart < #self.plsfiltered - entries + 1 then
                self.wndstart = self.wndstart + 1
            end
        end
        self.show(self)
    end,
    up = function(self)
        if self.cursor > 0 then
            self.cursor = self.cursor-1
            self.show(self)
        else
            if self.wndstart > 1 then
                self.wndstart = self.wndstart - 1
                self.show(self)
            end
        end
    end,

    play = function(self)
        mp.commandv("loadfile",
            self.pls[self.plsfiltered[self.wndstart+self.cursor]].filename)
        if self.plspos then
            self.pls[self.plspos].current = false
        end
        self.plspos = self.plsfiltered[self.wndstart + self.cursor]
        self.pls[self.plspos].current = true
    end
}

function add_bindings()
    keybinder.add("plsup", up, true)
    keybinder.add("plsdown", down, true)
    for i,v in ipairs(chars) do
        c = string.char(v)
        mp.add_forced_key_binding(c, 'search'..v, typing(c),"repeatable")
    end
    mp.add_forced_key_binding('SPACE', 'search32', typing(' '),"repeatable")

    mp.add_forced_key_binding('BS', 'searchbs', backspace,"repeatable")
    keybinder.add("plsenter", play)
end

function remove_bindings()
    keybinder.remove('plsup')
    keybinder.remove('plsdown')
    keybinder.remove('plsenter')
    for i,v in ipairs(chars) do
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
  for i,v in ipairs(t) do
    table.insert(result,i)
  end
  return result
end

function in_array(array, value)
    for _,v in ipairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

function mylower(s)
    local res,n = string.gsub(s,utf8_char,function (c)
                                    return utf8_uc_lc[c]
                                end)
    return res
end

function myupper(s)
    local res,n = string.gsub(s,utf8_char,function (c)
                                    return utf8_lc_uc[c]
                                end)
    return res
end

function prepat(s)
    -- prepare nocase and magic chars
    s = string.gsub(s, "[%^%$%(%)%%%.%[%]%*%+%-%?]",function (c)
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
        pattern = string.match(pattern,"(.*)"..utf8_char.."$")
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

function on_start_file()
    if is_playlist_loaded then
        playlister:init()
        mp.unregister_event(on_start_file)
        activate()
    else
        is_playlist_loaded = true
    end
end

if mp.get_opt("iptv") then
    mp.set_property_bool("idle", true)
    mp.set_property_bool("force-window", true)
    mp.register_event("start-file", on_start_file)
    keybinder.add("activate", activate)
end
