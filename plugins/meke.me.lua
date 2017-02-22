--[[ 
( #تم تعريب وتعديل الملف من المطور sofey_iq ) 
( #قناتنا DEVIL_CH ) 
--]]
do 

local function run(msg, matches) 
  if matches[1] == 'موقعي' then 
    if is_sudo(msg) then 
     send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false) 
      return "انتة🕵المطور الرئيسي للبوت🐸" 
    elseif is_admin(msg) then 
     send_document(get_receiver(msg), "./files/me/admin.webp", ok_cb, false) 
      return "انتة الله🐸يساعدك😂اذا كدر📌لحالتك" 
    elseif is_owner(msg) then 
     send_document(get_receiver(msg), "./files/me/leader.webp", ok_cb, false) 
      return "انتة المدير😂اوف منك ابو🐸المشاكل" 
    elseif is_momod(msg) then 
     send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false) 
      return "you're a moderator" 
    else 
     send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false) 
      return "انتة لاحولة😂ولاقوة📌ضل هيج احسن🐸" 
    end 
  end 
end 

return { 
  patterns = { 
    "^[!/]([Mm]e)$", 
    "^(موقعي)$" 
    }, 
  run = run 
} 
end 

--[[@sofey_iq ??? ??? ??? ??? ???? ?????:)]] 

