--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀     BY(@AHMED_ALOBIDE)               ▀▄ ▄▀ 
▀▄ ▄▀      BY(@hussian_9)                  ▀▄ ▄▀ 
▀▄ ▄▀                                      ▀▄ ▄▀   
▀▄ ▄▀           ملف قفل اعادة توجيه             ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
do

local function pre_process(msg)
    
    --Checking mute
    local hash = 'mate:'..msg.to.id
    if redis:get(hash) and msg.fwd_from and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg)  then
            delete_msg(msg.id, ok_cb, true)
            send_large_msg(get_receiver(msg), 'عزيزي '..msg.from.first_name..'\باع لك 🐸ملطلط لاتنشر صور🖼ولافيديو ولاروابط لا اهفك 👟 بقبقلي اشوهه لوجهك\n#username @'..msg.from.username)
            return "done"
        end
    
        return msg
    end

  


local function DevPoint(msg, matches)
    chat_id =  msg.to.id
    
    if is_momod(msg) and matches[1] == 'lock' then
      
            
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    return ""
  elseif is_momod(msg) and matches[1] == 'unlock' then
                    local hash = 'mate:'..msg.to.id
                    redis:del(hash)
                    return ""
end

end

return {
    patterns = {
        '^[/!#](lock) fwd$',
        '^[/!#](unlock) fwd$'
    },
    run = AHMED_ALOBIDE,
    pre_process = pre_process
}
end