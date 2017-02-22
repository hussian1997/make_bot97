--]]
do

local function run(msg, matches)
if is_momod(msg) and matches[1]== "المطور" then
return [[
🔺〰〰〰〰〰〰〰〰〰🔺
تعـال هنـا تـاج راسـي : 💛👼🏼

راسـل حـد المـطوين كـبد عمـري :🌹

📬/DEV:﴾ @AHMED_ALOBIDE ﴿
📬/DEV: 🐯﴾ @hussian_9 ﴿🐯
📬/DEV: 🎭﴾ @Tiq_ll ﴿🎭
📬/DEV: 🃏﴾ @TH2BOSS ﴿🃏
📬/DEV: ⚜﴾ @Project_313 ﴿⚜
📬/DEV: 🔷﴾ @EsT_IQ_XxX ﴿🔷
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
"(المطور)"
},
run = run 
}
end