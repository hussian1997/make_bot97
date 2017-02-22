--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀     BY(@AHMED_ALOBIDE)               ▀▄ ▄▀ 
▀▄ ▄▀      BY(@hussian_9)                  ▀▄ ▄▀ 
▀▄ ▄▀                                      ▀▄ ▄▀   
▀▄ ▄▀           (ملف الاوامر الانكلش)            ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
do

local function run(msg, matches)
if is_momod(msg) and matches[1]== "list2" then
return [[
〰〰〰〰〰〰〰〰〰〰
قائمة الاعضاء واوامر الحذف ورفع الادمنيه
〰〰〰〰〰〰〰〰〰〰
🔳👮🏻قائمة الاعضاء(who/)
🔳👮🏻معلومات العضو(info/)
🔳👮🏻معلومات الكروب(gpinfo/)
🔳👮🏻الاعدادات(settings/)
🔳👮🏻موقعك من الكروب(me/)
🔳👮🏻رفع ادمن(promote/)
🔳👮🏻تنزيل ادمن(demote/)
🔳👮🏻رفع اداري(setadmin/)
🔳👮🏻تنزيل اداري(demoteadmin/)
🔳👮🏻قائمة الادمنيه(admins/)
🔳👮🏻اخراج رابط الكروب(links/)
🔳👮🏻وضع رابط للكروب(setlink/)
🔳👮🏻رابط الكروب(linkpv/)
🔳👮🏻وضع رابط جديد(newlink/)
🔳👮🏻وضع قانون(setbout/)
🔳👮🏻رؤية قوانين المجموعه(rules/)
🔳👮🏻وضع وصف اكتب+(setbout/)
🔳👮🏻وضع اسم للكروب+(setname/)
🔳👮🏻وضع ترحيب+(setwlc/)
🔳👮🏻وضع توديع+(setbya/)
🔳👮🏻وضع صورة للكروب(set photo/)
〰〰〰〰〰〰〰〰〰〰
اوامر خاصة بالحذف القوانين ❌
〰〰〰〰〰〰〰〰〰〰
🔳👮🏻القوانين حذف(clean rules/)
🔳👮🏻الوصف حذف(clean about/)
🔳👮🏻الادمنيه حذف(clean modlist/)
🔳👮🏻المكتومين حذف(clean muteuser/)
🔳👮🏻رسالة الترحيب حذف(clean wlc/)
🔳👮🏻رسالة توديع حذف(clean bye/)
🔳👮🏻المعرف حذف(clean username/)
〰〰〰〰〰〰〰〰〰〰
جعلنا لكم البوت اقوى بوت حماية ع الاطلاق
〰〰〰〰〰〰〰〰〰〰
🛃المطور: @AHMED_ALOBIDE
🛃المطور:@hussian_9
🛃المطور:@Tiq_ll
🛃المطور:@project_kali
🛃المطور:@EsT_IQ_XxX

]]
end

if not is_momod(msg) then
return "Only managers 😐⛔️"
end

end
return {
description = "Help list", 
usage = "Help list",
patterns = {
"[#!/](list2)"
},
run = run 
}
end
