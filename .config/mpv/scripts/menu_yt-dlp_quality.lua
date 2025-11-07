-- path:   /home/klassiker/.local/share/repos/dotfiles/.config/mpv/scripts/menu_yt-dlp_quality.lua
-- author: klassiker [mrdotx]
-- url:    https://github.com/mrdotx/dotfiles
-- date:   2025-11-07T04:03:01+0100

-- key bindings
local binding_open   = "y"
local binding_close  = "ESC"
local binding_up     = "UP"
local binding_down   = "DOWN"
local binding_select = "ENTER"

-- osd
local osd_time      = 10
local osd_font_size = 8

-- menu
local selected_active     = "│󰑐 "
local selected_inactive   = "│󰐊 "
local unselected_active   = "│󰐎 "
local unselected_inactive = "│  "

local mp      = require 'mp'
local utils   = require 'mp.utils'
local msg     = require 'mp.msg'
local assdraw = require 'mp.assdraw'

local destroyer = nil

function show_menu()
    local selected = 1
    local active = 0
    local current_ytdl_format = mp.get_property("ytdl-format")
    msg.verbose("current ytdl-format: "..current_ytdl_format)
    local num_options = 0
    local options = {}

    options, num_options = download_formats()

    -- set the cursor to the current format
    for i, v in ipairs(options) do
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
        if     i == selected and i == active then return selected_active
        elseif i == selected then return selected_inactive end

        if     i ~= selected and i == active then return unselected_active
        elseif i ~= selected then return unselected_inactive end
    end

    function draw_menu()
        local ass = assdraw.ass_new()

        ass:append("{\\fs"..osd_font_size.."}")
        for i, v in ipairs(options) do
            ass:append(choose_prefix(i)..v.label.."\\N")
        end

        mp.set_osd_ass(0, 0, ass.text)
    end

    function destroy()
        timeout:kill()
        mp.set_osd_ass(0, 0, "")
        mp.remove_key_binding("close")
        mp.remove_key_binding("move_up")
        mp.remove_key_binding("move_down")
        mp.remove_key_binding("select")
        mp.remove_key_binding("escape")
        destroyer = nil
    end

    timeout = mp.add_periodic_timer(osd_time, destroy)
    destroyer = destroy

    mp.add_forced_key_binding(binding_close, "close", destroy)
    mp.add_forced_key_binding(binding_up, "move_up",
        function() selected_move(-1) end, "repeatable")
    mp.add_forced_key_binding(binding_down, "move_down",
        function() selected_move(1)  end, "repeatable")
    mp.add_forced_key_binding(binding_select, "select",
        function()
            destroy()
            mp.set_property("ytdl-format", options[selected].format)
            reload_resume()
        end)
    mp.add_forced_key_binding(binding_open, "escape", destroy)

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
        for i, v in ipairs(t) do
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

    if not ytdl.searched then
        local ytdl_mcd = mp.find_config_file("yt-dlp")
        if not ytdl_mcd == nil then
            msg.verbose("found yt-dlp at: "..ytdl_mcd)
            ytdl.path = ytdl_mcd
        end
        ytdl.searched = true
    end

    local command = {ytdl.path,
        "--no-warnings",
        "--no-playlist",
        "--format-sort", "+res,+fps,+vbr,+proto,ext",
        "--dump-single-json"
    }
    table.insert(command, url)
    local es, json, result = exec(command)

    if es < 0 or json == nil or json == "" then
        mp.osd_message("fetching formats failed...", 1)
        msg.error("failed to get format list: "..err)
        return {}, 0
    end

    local json, err = utils.parse_json(json)

    if json == nil then
        mp.osd_message("fetching formats failed...", 1)
        msg.error("failed to parse JSON data: "..err)
        return {}, 0
    end

    res = {}
    msg.verbose("yt-dlp succeeded!")
    for i, v in ipairs(json.formats) do
        -- show only items that have a video codec and no specific language
        if v.vcodec ~= "none" and v.language == nil then
            local l = string.format("%4.0fx%-4.0f %2.0fp %5.0fk %5s %4s.%s",
                        v.width or -0, v.height or -0,
                        v.fps or -0,
                        v.vbr or -0,
                        v.protocol:gsub("%S+",
                            {
                                ["http_dash_segments"] = "hds",
                                ["m3u8_native"] = "m3u8"
                            }) or "n/a",
                        v.ext or "n/a", string.match(v.vcodec, "[^.]+")
            )
            local f = string.format("%s+bestaudio/best", v.format_id)
            table.insert(res, {label=l, format=f})
        end
    end

    mp.osd_message("", 0)
    format_cache[url] = res
    return res, table_size(res)
end

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
mp.add_key_binding(binding_open, "quality", show_menu)
