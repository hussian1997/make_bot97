--]]
do

local function run(msg, matches)
if is_momod(msg) and matches[1]== "السورس" then
return [[
🔷🔻سورس بوت العراق ميكي🔺🔷 
🔺〰〰〰〰〰〰〰〰〰🔺
📡لطلب السورس الرجاء التوجة الى المبرمجين
📡لطلب بوت ميكي الرجاء التوجة الى المطورين
👨🏻‍🎤احمد العبيدي:@AHMED_ALOBIDE
👨🏾‍🔧حسين الخفاجي:@hussian_9
👨🏼‍🎤حمادة العكيدي:@Tiq_ll
👨‍🔧احمد الاسدي:@TH2BOSS
👨‍🎤سجاد العراقي:@Project_313
👨🏼‍💼هيبار العراقي:@EsT_IQ_XxX
🔺〰〰〰〰〰〰〰〰〰🔺
]]
end

if not is_momod(msg) then
return "عزيزي ابو دودة😢للمشرفين فقط😂"
end

end
return {
description = "Help list", 
usage = "Help list",
patterns = {
"(السورس)"
},
run = run 
}
end
