package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'
  ..';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'

require("./bot/utils")

VERSION = '0.12.2'

-- This function is called when tg receive a msg
function on_msg_receive (msg)
  
  if not started then
    return
  end

  local receiver = get_receiver(msg)

  -- vardump(msg)
  if msg_valid(msg) then
    msg = pre_process_msg(msg)
    if msg then
      match_plugins(msg)
      mark_read(receiver, ok_cb, false)
    end
  end
end

function ok_cb(extra, success, result)
end

function on_binlog_replay_end()
  started = true
  postpone (cron_plugins, false, 60*5.0)
  -- See plugins/isup.lua as an example for cron

  _config = load_config()

  -- load plugins
  plugins = {}
  load_plugins()
end

function msg_valid(msg)
  -- Don't process outgoing messages
  if msg.out then
    print('\27[36mNot valid: msg from us\27[39m')
    return false
  end

  -- Before bot was started
  if msg.date < now then
    print('\27[36mNot valid: old msg\27[39m')
    return false
  end

  if msg.unread == 0 then
    print('\27[36mNot valid: readed\27[39m')
    return false
  end

  if msg.service then
    print('\27[36mNot valid: service\27[39m')
    return false
  end

  if not msg.to.id then
    print('\27[36mNot valid: To id not provided\27[39m')
    return false
  end

  if not msg.from.id then
    print('\27[36mNot valid: From id not provided\27[39m')
    return false
  end

  if msg.from.id == our_id then
    print('\27[36mNot valid: Msg from our id\27[39m')
    return false
  end

  if msg.to.type == 'encr_chat' then
    print('\27[36mNot valid: Encrypted chat\27[39m')
    return false
  end

  return true
end

-- Apply plugin.pre_process function
function pre_process_msg(msg)
  for name,plugin in pairs(plugins) do
    if plugin.pre_process and msg then
      msg = plugin.pre_process(msg)
    end
  end

  return msg
end

-- Go over enabled plugins patterns.
function match_plugins(msg)
  for name, plugin in pairs(plugins) do
    match_plugin(plugin, name, msg)
  end
end

-- Check if plugin is on _config.disabled_plugin_on_chat table
local function is_plugin_disabled_on_chat(plugin_name, receiver)
  local disabled_chats = _config.disabled_plugin_on_chat
  -- Table exists and chat has disabled plugins
  if disabled_chats and disabled_chats[receiver] then
    -- Checks if plugin is disabled on this chat
    for disabled_plugin,disabled in pairs(disabled_chats[receiver]) do
      if disabled_plugin == plugin_name and disabled then
        local warning = 'Plugin '..disabled_plugin..' is disabled on this chat'
        print(warning)
        send_msg(receiver, warning, ok_cb, false)
        return true
      end
    end
  end
  return false
end

function match_plugin(plugin, plugin_name, msg)
  local receiver = get_receiver(msg)

  -- Go over patterns. If one matches it's enough.
  for k, pattern in pairs(plugin.patterns) do
    local matches = match_pattern(pattern, msg.text)
    if matches then
      print("msg matches: ", pattern)

      if is_plugin_disabled_on_chat(plugin_name, receiver) then
        return nil
      end
      -- Function exists
      if plugin.run then
        -- If plugin is for privileged users only
        if not warns_user_not_allowed(plugin, msg) then
          local result = plugin.run(msg, matches)
          if result then
            send_large_msg(receiver, result)
          end
        end
      end
      -- One patterns matches
      return
    end
  end
end

-- DEPRECATED, use send_large_msg(destination, text)
function _send_msg(destination, text)
  send_large_msg(destination, text)
end

-- Save the content of _config to config.lua
function save_config( )
  serialize_to_file(_config, './data/config.lua')
  print ('saved config into ./data/config.lua')
end

-- Returns the config from config.lua file.
-- If file doesn't exist, create it.
function load_config( )
  local f = io.open('./data/config.lua', "r")
  -- If config.lua doesn't exist
  if not f then
    print ("Created new config file: data/config.lua")
    create_config()
  else
    f:close()
  end
  local config = loadfile ("./data/config.lua")()
  for v,user in pairs(config.sudo_users) do
    print("Allowed user: " .. user)
  end
  return config
end

-- Create a basic config.json file and saves it.
function create_config( )
  -- A simple config with basic plugins and ourselves as privileged user
  config = {
    enabled_plugins = {
         "4",
    "APICLI",
    "addbot1",
    "admin",
    "all",
    "anti-spam",
    "anti_media",
    "ar-azan",
    "ar-badword",
    "ar-banhammmer",
    "ar-broadcast",
    "ar-getfile",
    "ar-h1",
    "ar-h2",
    "ar-h3",
    "ar-lock-bot",
    "ar-map",
    "ar-supergroup",
    "ar-weather",
    "arabic_lock",
    "auto_run",
    "azan",
    "banhammer",
    "broadcast",
    "bye",
    "dobye",
    "dowelcome",
    "echo",
    "filter",
    "get",
    "help",
    "helps.pv",
    "image23",
    "infoeng",
    "ingroup",
    "inpm",
    "inrealm",
    "instagram",
    "invite",
    "leave_ban",
    "linkpv",
    "list",
    "list3",
    "listt1",
    "lock_badword",
    "lock_emoji",
    "lock_english",
    "lock_fwwd",
    "lock_join",
    "lock_reply",
    "lock_tag",
    "lock_username",
    "meee12",
    "msg_checks",
    "music_eng",
    "onservice",
    "owners",
    "plugins",
    "rdod",
    "rebot",
    "rediss",
    "Replly",
    "send",
    "serverinfo",
    "set",
    "set_type",
    "short_link",
    "stats",
    "sticker23",
    "sudolist",
    "superr",
    "tag_english",
    "textphoto",
    "time",
    "translate",
    "voice",
    "welecam",
    "whitelist",
    "writer",
    "wife.bot",
    "car",
    "run",
    "ar-h4",
    "RDOD",
    "arr-fwwd",
    "ar-lock-fwd",
    "meke.acdar",
    "meke.addbot",
    "meke.sorus",
    "meke.dev",
    "meke.talem",
    "meke.welacam",
    "meke.tadel1",
    "ar-h11",
    "ar-h22",
    "ar-h33",
    "ar-h44",
    "ar-h55",
    "ar-supergroupT",
    "meke.cudo",
    "meke.del.masg",
    "meke.deleatd",
    "meke.me",
    "meke.uoser",
    "Repllly" },
    sudo_users =  { 73928866,250180860,177659243,0,tonumber(our_id)},
    disabled_channels = {}
  }
  serialize_to_file(config, './data/config.lua')
  print ('saved config into ./data/config.lua')
end

function on_our_id (id)
  our_id = id
end

function on_user_update (user, what)
  --vardump (user)
end

function on_chat_update (chat, what)
  --vardump (chat)
end

function on_secret_chat_update (schat, what)
  --vardump (schat)
end

function on_get_difference_end ()
end

-- Enable plugins in config.json
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("Loading plugin", v)

    local ok, err =  pcall(function()
      local t = loadfile("plugins/"..v..'.lua')()
      plugins[v] = t
    end)

    if not ok then
      print('\27[31mError loading plugin '..v..'\27[39m')
      print('\27[31m'..err..'\27[39m')
    end

  end
end

-- Call and postpone execution for cron plugins
function cron_plugins()

  for name, plugin in pairs(plugins) do
    -- Only plugins with cron function
    if plugin.cron ~= nil then
      plugin.cron()
    end
  end

  -- Called again in 5 mins
  postpone (cron_plugins, false, 5*60.0)
end

-- Start and load values
our_id = 0
now = os.time()
math.randomseed(now)
started = false
