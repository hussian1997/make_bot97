--@AHMED_ALOBIDE
do 
local function run(msg, matches) 
 if is_sudo(msg) then 
   local sajody = "❤️صار استاذي😍 انجبيت ❤️"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end
 if is_owner(msg) then 
   local sajody = "راح اجاوزك 👻بسرعتي 💨🏃"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if is_momod(msg) then 
   local sajody = "🖕🏿انجب انتة هوة انتة خلك 😏حارس للكروب 😂"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
 if not is_momod(msg) then 
   local sajody = "انجب انت/ي واني انجب🌝❤"
   return reply_msg(msg.id, sajody, ok_cb, false)
 end 
end 
--@AHMED_ALOBIDE
return { 
 patterns = { 
   "^(انجب)$" 
 }, 
 run = run, 
} 

end
--@hussian_9