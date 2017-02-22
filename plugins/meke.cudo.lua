--[[  --By @meke.bot.iraq
--]]
local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 
 
function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end 
   function h_k_a(msg, matches) 
    if tonumber (msg.from.id) == 259142888 then 
       if matches[1]:lower() == "اضف مطور" then 
          table.insert(_config.sudo_users, tonumber(matches[2])) 
      print(matches[2] ..' تم اضافه مطور🐸جديد🔫في البوت') 
     save_config() 
     reload_plugins(true) 
      return matches[2] ..' تم اضافه🐸مطور جديد❤️في البوت' 
   elseif matches[1]:lower() == "حذف مطور" then 
      local k = tonumber(matches[2]) 
          table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
      print(matches[2] ..' تم حذف😢المطور من🚶البوت') 
     save_config() 
     reload_plugins(true) 
      return matches[2] ..' تم😢حذف المطور من❤️البوت' 
      end 
   end 
end 
return { 
patterns = { 
"^(اضف مطور) (%d+)$", 
"^(حذف مطور) (%d+)$",
"^[#!/](اضف مطور) (%d+)$", 
"^[#!/](حذف مطور) (%d+)$" 
}, 
run = h_k_a 
}



--[[ --By @meke.bot.iraq
--]]
