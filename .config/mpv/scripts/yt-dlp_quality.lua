-- path:   /home/klassiker/.local/share/repos/dotfiles/.config/mpv/scripts/yt-dlp_quality.lua
-- author: klassiker [mrdotx]
-- github: https://github.com/mrdotx/dotfiles
-- date:   2024-07-20T05:35:18+0200

-- key bindings
local toggle_menu_binding = "y"
local up_binding          = "UP"
local down_binding        = "DOWN"
local select_binding      = "ENTER"

-- osd
local osd_time = 5

-- formatting / cursors
local selected_and_active     = "│󰑐 "
local selected_and_inactive   = "│󰐊 "
local unselected_and_active   = "│󰐎 "
local unselected_and_inactive = "│  "

-- default menu entries
local quality_strings = [[
    [
    {"7680x4320 4320p 8KUHD" : "bestvideo[height<=?4320]+bestaudio/best"},
    {"3840x2160 2160p 4KUHD" : "bestvideo[height<=?2160]+bestaudio/best"},
    {"2560x1440 1440p WQHD"  : "bestvideo[height<=?1440]+bestaudio/best"},
    {"1920x1080 1080p FHD"   : "bestvideo[height<=?1080]+bestaudio/best"},
    {"1280x720   720p WXGA"  : "bestvideo[height<=?720]+bestaudio/best"},
    {" 854x480   480p FWVGA" : "bestvideo[height<=?480]+bestaudio/best"},
    {" 640x360   360p nHD"   : "bestvideo[height<=?360]+bestaudio/best"},
    {" 426x240   240p NTSC"  : "bestvideo[height<=?240]+bestaudio/best"},
    {" 256x144   144p YT"    : "bestvideo[height<=?144]+bestaudio/best"}
    ]
]]

-- use yt-dlp to fetch a list of available formats (overrides quality_strings)
local fetch_formats = true

local mp = require 'mp'
local utils = require 'mp.utils'
local msg = require 'mp.msg'
local assdraw = require 'mp.assdraw'

quality_strings = utils.parse_json(quality_strings)

local destroyer = nil

function show_menu()
    local selected = 1
    local active = 0
    local current_ytdl_format = mp.get_property("ytdl-format")
    msg.verbose("current ytdl-format: "..current_ytdl_format)
    local num_options = 0
    local options = {}

    if fetch_formats then
        options, num_options = download_formats()
    end

    if next(options) == nil then
        for i,v in ipairs(quality_strings) do
            num_options = num_options + 1
            for k,v2 in pairs(v) do
                options[i] = {label = k, format = v2}
                if v2 == current_ytdl_format then
                    active = i
                    selected = active
                end
            end
        end
    end

    -- set the cursor to the currently format
    for i,v in ipairs(options) do
        if v.format == current_ytdl_format then
            active = i
            selected = active
            break
        end
    end

    function selected_move(amt)
        selected = selected + amt
        if selected < 1 then selected = num_options
        elseif selected > num_options then selected = 1 end
        timeout:kill()
        timeout:resume()
        draw_menu()
    end

    function choose_prefix(i)
        if     i == selected and i == active then return selected_and_active 
        elseif i == selected then return selected_and_inactive end

        if     i ~= selected and i == active then return unselected_and_active
        elseif i ~= selected then return unselected_and_inactive end
    end

    function draw_menu()
        local ass = assdraw.ass_new()

        for i,v in ipairs(options) do
            ass:append(choose_prefix(i)..v.label.."\\N")
        end

        mp.set_osd_ass(0, 0, ass.text)
    end

    function destroy()
        timeout:kill()
        mp.set_osd_ass(0,0,"")
        mp.remove_key_binding("move_up")
        mp.remove_key_binding("move_down")
        mp.remove_key_binding("select")
        mp.remove_key_binding("escape")
        destroyer = nil
    end

    timeout = mp.add_periodic_timer(osd_time, destroy)
    destroyer = destroy

    mp.add_forced_key_binding(up_binding,     "move_up",
        function() selected_move(-1) end, {repeatable=true})
    mp.add_forced_key_binding(down_binding,   "move_down",
        function() selected_move(1)  end, {repeatable=true})
    mp.add_forced_key_binding(select_binding, "select",
        function()
            destroy()
            mp.set_property("ytdl-format", options[selected].format)
            reload_resume()
        end)
    mp.add_forced_key_binding(toggle_menu_binding, "escape", destroy)

    draw_menu()
    return
end

local ytdl = {
    path = "yt-dlp",
    searched = false,
    blacklisted = {}
}

format_cache = {}
function download_formats()
    local function exec(args)
        local ret = utils.subprocess({args = args})
        return ret.status, ret.stdout, ret
    end

    local function table_size(t)
        s = 0
        for i,v in ipairs(t) do
            s = s + 1
        end
        return s
    end

    local url = mp.get_property("path")

    -- strip possible ytdl:// prefix.
    url = string.gsub(url, "ytdl://", "")

    -- don't fetch the format list if we already have it
    if format_cache[url] ~= nil then 
        local res = format_cache[url]
        return res, table_size(res)
    end
    mp.osd_message("fetching available formats with yt-dlp...", 60)

    if not (ytdl.searched) then
        local ytdl_mcd = mp.find_config_file("yt-dlp")
        if not (ytdl_mcd == nil) then
            msg.verbose("found yt-dlp at: "..ytdl_mcd)
            ytdl.path = ytdl_mcd
        end
        ytdl.searched = true
    end

    local command = {ytdl.path, 
        "--no-warnings", "--no-playlist", "--dump-single-json"}
    table.insert(command, url)
    local es, json, result = exec(command)

    if (es < 0) or (json == nil) or (json == "") then
        mp.osd_message("fetching formats failed...", 1)
        msg.error("failed to get format list: "..err)
        return {}, 0
    end

    local json, err = utils.parse_json(json)

    if (json == nil) then
        mp.osd_message("fetching formats failed...", 1)
        msg.error("failed to parse JSON data: "..err)
        return {}, 0
    end

    res = {}
    msg.verbose("yt-dlp succeeded!")
    for i,v in ipairs(json.formats) do
        if v.vcodec ~= "none" then
            local l = string.format("%4sx%-4s %-2s %.5s %4s.%s", 
                        v.width, v.height, v.fps, v.protocol, v.ext, v.vcodec)
            local f = string.format("%s+bestaudio/best", v.format_id)
            table.insert(res, {label=l, format=f, width=v.width})
        end
    end

    table.sort(res, function(a, b) return a.width > b.width end)

    mp.osd_message("", 0)
    format_cache[url] = res
    return res, table_size(res)
end

-- register script message to show menu
mp.register_script_message("toggle-quality", 
function()
    if destroyer ~= nil then
        destroyer()
    else
        show_menu()
    end
end)

-- keybind to launch menu
mp.add_key_binding(toggle_menu_binding, "quality", show_menu)

function reload_resume()
    local reload_duration = mp.get_property_native("duration")
    local time_pos = mp.get_property("time-pos")

    mp.command('playlist-play-index current')

    if reload_duration and reload_duration > 0 then
        local function seeker()
            mp.commandv('seek', time_pos, 'absolute+exact')
            mp.unregister_event(seeker)
        end
        mp.register_event("file-loaded", seeker)
    end
end
