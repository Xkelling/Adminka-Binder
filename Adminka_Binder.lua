script_name("Adminka Binder")

require "lib.moonloader"
--
local dlstatus = require('moonloader').download_status
update_state = false
local script_vers = 1.1
local script_vers_text = "v1.1"

local update_url = "https://raw.githubusercontent.com/Xkelling/AutoUpdate/main/update.ini" -- тут тоже свою ссылку
local update_path = getWorkingDirectory() .. "/update.ini" -- и тут свою ссылку

local script_url = "https://github.com/Xkelling/AutoUpdate/raw/main/Adminka_Binder.lua" -- тут свою ссылку
local script_path = thisScript().path
--
require 'lib.vkeys'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local inicfg = require 'inicfg'

local mainIni = inicfg.load({
config =
{
AutoB = false,
F2 = false,
cc = false,
theme = 0,
--
Voda = u8'Вода',
Voda_Text = u8'Администрация не вытаскивает из воды.',
--
Tex = u8'Тех. Раздел',
Tex_Text = u8'Напишите жалобу в технический раздел сервера.',
--
Flip = u8'Флип',
Flip_Text = u8"Администрация не флипает игроков. Вы можете купить предмет 'Домкрат' в любой АЗС.",
--
Spawn = u8'Спавн',
Spawn_Text = u8"Администрация не спавнит игроков без причины.",
--
TP = u8'Телепорт',
TP_Text = u8"Администрация не телепортирует игроков без причины.",
--
Trans = u8'Транспорт',
Trans_Text = u8"Администрация не выдаёт транспорт без причины.",
--
HP = u8'ХП',
HP_Text = u8"Администрация не выдаёт здоровье без причины.",
--
new1 = u8'Уточните',
new1_Text = u8'Уважаемый игрок, уточните Ваш вопрос, пожалуйста.',
--
new2 = u8'Ремонт',
new2_Text = u8'Администрация не ремонтирует ТС.'
}
}, "Adminka Binder")

local main_window_state = imgui.ImBool(true)
local two_window_state = imgui.ImBool(false)
local three_window_state = imgui.ImBool(false)
local AutoB = imgui.ImBool(mainIni.config.AutoB)
local F2 = imgui.ImBool(mainIni.config.F2)
local cc = imgui.ImBool(mainIni.config.cc)
local theme = imgui.ImInt(mainIni.config.theme)
--
local Voda = imgui.ImBuffer(''..mainIni.config.Voda, 256)
local Voda_Text = imgui.ImBuffer(''..mainIni.config.Voda_Text, 256)
--
local Tex = imgui.ImBuffer(''..mainIni.config.Tex, 256)
local Tex_Text = imgui.ImBuffer(''..mainIni.config.Tex_Text, 256)
--
local Flip = imgui.ImBuffer(''..mainIni.config.Flip, 256)
local Flip_Text = imgui.ImBuffer(''..mainIni.config.Flip_Text, 256)
--
local Spawn = imgui.ImBuffer(''..mainIni.config.Spawn, 256)
local Spawn_Text = imgui.ImBuffer(''..mainIni.config.Spawn_Text, 256)
--
local TP = imgui.ImBuffer(''..mainIni.config.TP, 256)
local TP_Text = imgui.ImBuffer(''..mainIni.config.TP_Text, 256)
--
local Trans = imgui.ImBuffer(''..mainIni.config.Trans, 256)
local Trans_Text = imgui.ImBuffer(''..mainIni.config.Trans_Text, 256)
--
local HP = imgui.ImBuffer(''..mainIni.config.HP, 256)
local HP_Text = imgui.ImBuffer(''..mainIni.config.HP_Text, 256)
--
local new1 = imgui.ImBuffer(''..mainIni.config.new1, 256)
local new1_Text = imgui.ImBuffer(''..mainIni.config.new1_Text, 256)
--
local new2 = imgui.ImBuffer(''..mainIni.config.new2, 256)
local new2_Text = imgui.ImBuffer(''..mainIni.config.new2_Text, 256)
--

local items = {
  u8"Красная тема",
  u8"Тёмная тема",
  u8"Бело-Синяя тема",
	u8"Оранжевая тема",
	u8"Зелёная тема",
	u8"Жёлтая тема",
	u8"Синяя тема"
}


function imgui.OnDrawFrame()
if mainIni.config.theme == 0 then theme1() end
if mainIni.config.theme == 1 then theme2() end
if mainIni.config.theme == 2 then theme3() end
if mainIni.config.theme == 3 then theme4() end
if mainIni.config.theme == 4 then theme5() end
if mainIni.config.theme == 5 then theme6() end
if mainIni.config.theme == 6 then theme7() end
if main_window_state.v then -- чтение и запись значения такой переменной осуществляется через поле v (или Value)
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
imgui.SetNextWindowSize(imgui.ImVec2(297, 137), imgui.Cond.FirstUseEver)
imgui.Begin('##main_window_state', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)


if imgui.Button(u8""..mainIni.config.Voda, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.Voda_Text))
else sampSendChat(u8:decode(""..mainIni.config.Voda_Text))
end end

imgui.SameLine()

if imgui.Button(u8""..mainIni.config.Tex, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.Tex_Text))
else sampSendChat(u8:decode(""..mainIni.config.Tex_Text))
end end

imgui.SameLine()

if imgui.Button(u8""..mainIni.config.Flip, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.Flip_Text))
else sampSendChat(u8:decode(""..mainIni.config.Flip_Text))
end end

if imgui.Button(u8""..mainIni.config.Spawn, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.Spawn_Text))
else sampSendChat(u8:decode(""..mainIni.config.Spawn_Text))
end end

imgui.SameLine()

if imgui.Button(u8""..mainIni.config.TP, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.TP_Text))
else sampSendChat(u8:decode(""..mainIni.config.TP_Text))
end end

imgui.SameLine()

if imgui.Button(u8""..mainIni.config.Trans, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.Trans_Text))
else sampSendChat(u8:decode(""..mainIni.config.Trans_Text))
end end

if imgui.Button(u8""..mainIni.config.HP, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.HP_Text))
else sampSendChat(u8:decode(""..mainIni.config.HP_Text))
end end

imgui.SameLine()

if imgui.Button(u8""..mainIni.config.new1, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.new1_Text))
else sampSendChat(u8:decode(""..mainIni.config.new1_Text))
end end

imgui.SameLine()

if imgui.Button(u8""..mainIni.config.new2, imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat(u8:decode("/b "..mainIni.config.new2_Text))
else sampSendChat(u8:decode(""..mainIni.config.new2_Text))
end end

--

imgui.Separator()

if imgui.Button(u8"Настройки", imgui.ImVec2(-0.1, 20)) then window() end
if imgui.Button(u8'Включить/Выключить Курсор', imgui.ImVec2(-0.1, 20)) then imgui.ShowCursor = not imgui.ShowCursor end

imgui.End()
end







if two_window_state.v then
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
imgui.SetNextWindowSize(imgui.ImVec2(300, 175), imgui.Cond.FirstUseEver)
imgui.Begin(u8'##two_window_state', two_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)

imgui.SetCursorPosX((imgui.GetWindowWidth() - imgui.CalcTextSize(u8"Автор скрипта: Yuki Rice").x) / 2)
imgui.Text(u8'Автор скрипта: Yuki Rice')

if imgui.RadioButton(u8"Авто /b", AutoB.v) then
	AutoB.v = not AutoB.v
	mainIni.config.AutoB = AutoB.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

imgui.SameLine()
imgui.TextQuestion(u8'Сообщения из биндера буду писаться в чат через /b.')

if imgui.RadioButton(u8'Курсор на кнопку', F2.v) then
	F2.v = not F2.v
	mainIni.config.F2 = F2.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
imgui.SameLine()
imgui.TextQuestion(u8'На клавишу F2 будет активироваться/деактивироваться курсор')


if imgui.RadioButton(u8"/cc", cc.v) then
	cc.v = not cc.v
	mainIni.config.cc = cc.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

imgui.SameLine()
imgui.TextQuestion(u8'Очистит чат на 30 строчек (ВИЗУАЛЬНО)')


if imgui.Combo(u8'Темы скрипта', theme, items, -1)then
	mainIni.config.theme = theme.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

imgui.Separator()

if imgui.Button(u8'Редактор биндера', imgui.ImVec2(-0.1, 20)) then window_3() end
if imgui.Button(u8'Закрыть окно', imgui.ImVec2(-0.1, 20)) then window() end

imgui.End()
end




if three_window_state.v then
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
imgui.SetNextWindowSize(imgui.ImVec2(500, 835), imgui.Cond.FirstUseEver)
imgui.Begin(u8'##three_window_state', three_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)

    imgui.BeginChild("##1234", imgui.ImVec2(480, 770), true)

if imgui.InputText(u8'Название кнопки ##1', Voda) then
	mainIni.config.Voda = Voda.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##1', Voda_Text) then
	mainIni.config.Voda_Text = Voda_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##2', Tex) then
	mainIni.config.Tex = Tex.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##2', Tex_Text) then
	mainIni.config.Tex_Text = Tex_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##3', Flip) then
	mainIni.config.Flip = Flip.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##3', Flip_Text) then
	mainIni.config.Flip_Text = Flip_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##4', Spawn) then
	mainIni.config.Spawn = Spawn.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##4', Spawn_Text) then
	mainIni.config.Spawn_Text = Spawn_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##5', TP) then
	mainIni.config.TP = TP.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##5', TP_Text) then
	mainIni.config.TP_Text = TP_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##6', Trans) then
	mainIni.config.Trans = Trans.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##6', Trans_Text) then
	mainIni.config.Trans_Text = Trans_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##7', HP) then
	mainIni.config.HP = HP.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##7', HP_Text) then
	mainIni.config.HP_Text = HP_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end
--
imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##8', new1) then
	mainIni.config.new1 = new1.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##8', new1_Text) then
	mainIni.config.new1_Text = new1_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

imgui.Text("")
imgui.Separator()
imgui.Text("")
--
if imgui.InputText(u8'Название кнопки ##9', new2) then
	mainIni.config.new2 = new2.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

if imgui.InputText(u8'Текст кнопки ##9', new2_Text) then
	mainIni.config.new2_Text = new2_Text.v
	inicfg.save(mainIni, 'Adminka Binder.ini')
end

imgui.EndChild()

if imgui.Button(u8'Сбросить настройки', imgui.ImVec2(-0.1, 20)) then sbros() end
if imgui.Button(u8'Закрыть окно', imgui.ImVec2(-0.1, 20)) then window_3() end

imgui.End()
end



end

function main()
if not isSampfuncsLoaded() or not isSampLoaded() then return end
while not isSampAvailable() do wait(100) end
sampAddChatMessage("{69b2ff}>>Adminka Binder v1.1<< {FFFFFF}Активация - /adm", -1)
sampRegisterChatCommand("adm", cmd_adm)
sampRegisterChatCommand("cc", cmd_cc)
imgui.Process = false
imgui.ShowCursor = false

--
downloadUrlToFile(update_url, update_path, function(id, status)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
				updateIni = inicfg.load(nil, update_path)
				if tonumber(updateIni.info.vers) > script_vers then
						sampAddChatMessage("{69b2ff}>>Adminka Binder v1.1<< {FFFFFF}Есть обновление! Версия: " .. updateIni.info.vers_text, -1)
						update_state = true
				end
				os.remove(update_path)
		end
end)
--

while true do
wait(0)
imgui.Process = main_window_state.v or two_window_state.v or three_window_state.v

if F2.v then
	if isKeyJustPressed(VK_F2) then
		imgui.ShowCursor = not imgui.ShowCursor
	end
end

if update_state then
		downloadUrlToFile(script_url, script_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
						sampAddChatMessage("{69b2ff}>>Adminka Binder v1.1<< {FFFFFF}Скрипт успешно обновлен!", -1)
						thisScript():reload()
				end
		end)
		break
end

end
end


function cmd_adm()
main_window_state.v = not main_window_state.v
end

function window()
two_window_state.v = not two_window_state.v
end

function window_3()
	three_window_state.v = not three_window_state.v
end

function sbros()
	--
	mainIni.config.Voda = u8'Вода'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.Voda_Text = u8'Администрация не вытаскивает из воды.'
	inicfg.save(mainIni, 'Adminka Binder.ini')
  --
	mainIni.config.Tex = u8'Тех. Раздел'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.Tex_Text = u8'Напишите жалобу в технический раздел сервера.'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	--
	mainIni.config.Flip = u8'Флип'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.Flip_Text = u8"Администрация не флипает игроков. Вы можете купить предмет 'Домкрат' в любой АЗС."
	inicfg.save(mainIni, 'Adminka Binder.ini')
	--
	mainIni.config.Spawn = u8'Спавн'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.Spawn_Text = u8"Администрация не спавнит игроков без причины."
	inicfg.save(mainIni, 'Adminka Binder.ini')
  --
	mainIni.config.TP = u8'Телепорт'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.TP_Text = u8"Администрация не телепортирует игроков без причины."
	inicfg.save(mainIni, 'Adminka Binder.ini')
  --
	mainIni.config.Trans = u8'Транспорт'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.Trans_Text = u8"Администрация не выдаёт транспорт без причины."
	inicfg.save(mainIni, 'Adminka Binder.ini')
  --
	mainIni.config.HP = u8'ХП'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.HP_Text = u8"Администрация не выдаёт здоровье без причины."
	inicfg.save(mainIni, 'Adminka Binder.ini')
	--
	mainIni.config.new1 = u8'Уточните'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.new1_Text = u8'Уточните Ваш вопрос, пожалуйста.'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	--
	mainIni.config.new2 = u8'Ремонт'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	mainIni.config.new2_Text = u8'Администрация не ремонтирует ТС.'
	inicfg.save(mainIni, 'Adminka Binder.ini')
	--
thisScript():reload()
end


function cmd_cc(arg)
if cc.v then
for i=0,30 do
sampAddChatMessage('',-1)
end
end
end


function imgui.TextQuestion(text)
imgui.TextDisabled(u8'(Подсказка)')
if imgui.IsItemHovered() then
imgui.BeginTooltip()
imgui.PushTextWrapPos(450)
imgui.TextUnformatted(text)
imgui.PopTextWrapPos()
imgui.EndTooltip() end end


function theme1()
imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4

style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 0.40)
colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
colors[clr.Separator]              = colors[clr.Border]
colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
colors[clr.ComboBg]                = colors[clr.PopupBg]
colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end


function theme2()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

	colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
	colors[clr.TextDisabled]           = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.ChildWindowBg]          = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.PopupBg]                = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.Border]                 = ImVec4(0.82, 0.77, 0.78, 1.00)
	colors[clr.BorderShadow]           = ImVec4(0.35, 0.35, 0.35, 0.66)
	colors[clr.FrameBg]                = ImVec4(1.00, 1.00, 1.00, 0.28)
	colors[clr.FrameBgHovered]         = ImVec4(0.68, 0.68, 0.68, 0.67)
	colors[clr.FrameBgActive]          = ImVec4(0.79, 0.73, 0.73, 0.62)
	colors[clr.TitleBg]                = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.46, 0.46, 0.46, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.MenuBarBg]              = ImVec4(0.00, 0.00, 0.00, 0.80)
	colors[clr.ScrollbarBg]            = ImVec4(0.00, 0.00, 0.00, 0.60)
	colors[clr.ScrollbarGrab]          = ImVec4(1.00, 1.00, 1.00, 0.87)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(1.00, 1.00, 1.00, 0.79)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.80, 0.50, 0.50, 0.40)
	colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 0.99)
	colors[clr.CheckMark]              = ImVec4(0.99, 0.99, 0.99, 0.52)
	colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 0.42)
	colors[clr.SliderGrabActive]       = ImVec4(0.76, 0.76, 0.76, 1.00)
	colors[clr.Button]                 = ImVec4(0.51, 0.51, 0.51, 0.60)
	colors[clr.ButtonHovered]          = ImVec4(0.68, 0.68, 0.68, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.67, 0.67, 0.67, 1.00)
	colors[clr.Header]                 = ImVec4(0.72, 0.72, 0.72, 0.54)
	colors[clr.HeaderHovered]          = ImVec4(0.92, 0.92, 0.95, 0.77)
	colors[clr.HeaderActive]           = ImVec4(0.82, 0.82, 0.82, 0.80)
	colors[clr.Separator]              = ImVec4(0.73, 0.73, 0.73, 1.00)
	colors[clr.SeparatorHovered]       = ImVec4(0.81, 0.81, 0.81, 1.00)
	colors[clr.SeparatorActive]        = ImVec4(0.74, 0.74, 0.74, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.80, 0.80, 0.80, 0.30)
	colors[clr.ResizeGripHovered]      = ImVec4(0.95, 0.95, 0.95, 0.60)
	colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 0.90)
	colors[clr.CloseButton]            = ImVec4(0.45, 0.45, 0.45, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.70, 0.70, 0.90, 0.60)
	colors[clr.CloseButtonActive]      = ImVec4(0.70, 0.70, 0.70, 1.00)
	colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(1.00, 1.00, 1.00, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.88, 0.88, 0.88, 0.35)
end



function theme3()
imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4

style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

colors[clr.Text]   = ImVec4(0.00, 0.00, 0.00, 0.51)
colors[clr.TextDisabled]   = ImVec4(0.24, 0.24, 0.24, 1.00)
colors[clr.WindowBg]              = ImVec4(1.00, 1.00, 1.00, 1.00)
colors[clr.ChildWindowBg]         = ImVec4(0.96, 0.96, 0.96, 1.00)
colors[clr.PopupBg]               = ImVec4(0.92, 0.92, 0.92, 1.00)
colors[clr.Border]                = ImVec4(0.86, 0.86, 0.86, 1.00)
colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.FrameBg]               = ImVec4(0.88, 0.88, 0.88, 1.00)
colors[clr.FrameBgHovered]        = ImVec4(0.82, 0.82, 0.82, 1.00)
colors[clr.FrameBgActive]         = ImVec4(0.76, 0.76, 0.76, 1.00)
colors[clr.TitleBg]               = ImVec4(0.00, 0.45, 1.00, 0.82)
colors[clr.TitleBgCollapsed]      = ImVec4(0.00, 0.45, 1.00, 0.82)
colors[clr.TitleBgActive]         = ImVec4(0.00, 0.45, 1.00, 0.82)
colors[clr.MenuBarBg]             = ImVec4(0.00, 0.37, 0.78, 1.00)
colors[clr.ScrollbarBg]           = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.ScrollbarGrab]         = ImVec4(0.00, 0.35, 1.00, 0.78)
colors[clr.ScrollbarGrabHovered]  = ImVec4(0.00, 0.33, 1.00, 0.84)
colors[clr.ScrollbarGrabActive]   = ImVec4(0.00, 0.31, 1.00, 0.88)
colors[clr.ComboBg]               = ImVec4(0.92, 0.92, 0.92, 1.00)
colors[clr.CheckMark]             = ImVec4(0.00, 0.49, 1.00, 0.59)
colors[clr.SliderGrab]            = ImVec4(0.00, 0.49, 1.00, 0.59)
colors[clr.SliderGrabActive]      = ImVec4(0.00, 0.39, 1.00, 0.71)
colors[clr.Button]                = ImVec4(0.00, 0.49, 1.00, 0.59)
colors[clr.ButtonHovered]         = ImVec4(0.00, 0.49, 1.00, 0.71)
colors[clr.ButtonActive]          = ImVec4(0.00, 0.49, 1.00, 0.78)
colors[clr.Header]                = ImVec4(0.00, 0.49, 1.00, 0.78)
colors[clr.HeaderHovered]         = ImVec4(0.00, 0.49, 1.00, 0.71)
colors[clr.HeaderActive]          = ImVec4(0.00, 0.49, 1.00, 0.78)
colors[clr.ResizeGrip]            = ImVec4(0.00, 0.39, 1.00, 0.59)
colors[clr.ResizeGripHovered]     = ImVec4(0.00, 0.27, 1.00, 0.59)
colors[clr.ResizeGripActive]      = ImVec4(0.00, 0.25, 1.00, 0.63)
colors[clr.CloseButton]           = ImVec4(0.00, 0.35, 0.96, 0.71)
colors[clr.CloseButtonHovered]    = ImVec4(0.00, 0.31, 0.88, 0.69)
colors[clr.CloseButtonActive]     = ImVec4(0.00, 0.25, 0.88, 0.67)
colors[clr.PlotLines]             = ImVec4(0.00, 0.39, 1.00, 0.75)
colors[clr.PlotLinesHovered]      = ImVec4(0.00, 0.39, 1.00, 0.75)
colors[clr.PlotHistogram]         = ImVec4(0.00, 0.39, 1.00, 0.75)
colors[clr.PlotHistogramHovered]  = ImVec4(0.00, 0.35, 0.92, 0.78)
colors[clr.TextSelectedBg]        = ImVec4(0.00, 0.47, 1.00, 0.59)
colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35)
end


function theme4()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

		style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

    colors[clr.Text]                 = ImVec4(0.92, 0.92, 0.92, 1.00)
    colors[clr.TextDisabled]         = ImVec4(0.44, 0.44, 0.44, 1.00)
    colors[clr.WindowBg]             = ImVec4(0.06, 0.06, 0.06, 1.00)
    colors[clr.ChildWindowBg]        = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]               = ImVec4(0.51, 0.36, 0.15, 1.00)
    colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]              = ImVec4(0.11, 0.11, 0.11, 1.00)
    colors[clr.FrameBgHovered]       = ImVec4(0.51, 0.36, 0.15, 1.00)
    colors[clr.FrameBgActive]        = ImVec4(0.78, 0.55, 0.21, 1.00)
    colors[clr.TitleBg]              = ImVec4(0.51, 0.36, 0.15, 1.00)
    colors[clr.TitleBgActive]        = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.TitleBgCollapsed]     = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.MenuBarBg]            = ImVec4(0.11, 0.11, 0.11, 1.00)
    colors[clr.ScrollbarBg]          = ImVec4(0.06, 0.06, 0.06, 0.53)
    colors[clr.ScrollbarGrab]        = ImVec4(0.21, 0.21, 0.21, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.47, 0.47, 0.47, 1.00)
    colors[clr.ScrollbarGrabActive]  = ImVec4(0.81, 0.83, 0.81, 1.00)
    colors[clr.CheckMark]            = ImVec4(0.78, 0.55, 0.21, 1.00)
    colors[clr.SliderGrab]           = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.SliderGrabActive]     = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.Button]               = ImVec4(0.51, 0.36, 0.15, 1.00)
    colors[clr.ButtonHovered]        = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.ButtonActive]         = ImVec4(0.78, 0.55, 0.21, 1.00)
    colors[clr.Header]               = ImVec4(0.51, 0.36, 0.15, 1.00)
    colors[clr.HeaderHovered]        = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.HeaderActive]         = ImVec4(0.93, 0.65, 0.14, 1.00)
    colors[clr.Separator]            = ImVec4(0.21, 0.21, 0.21, 1.00)
    colors[clr.SeparatorHovered]     = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.SeparatorActive]      = ImVec4(0.78, 0.55, 0.21, 1.00)
    colors[clr.ResizeGrip]           = ImVec4(0.21, 0.21, 0.21, 1.00)
    colors[clr.ResizeGripHovered]    = ImVec4(0.91, 0.64, 0.13, 1.00)
    colors[clr.ResizeGripActive]     = ImVec4(0.78, 0.55, 0.21, 1.00)
    colors[clr.CloseButton]          = ImVec4(0.47, 0.47, 0.47, 1.00)
    colors[clr.CloseButtonHovered]   = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]    = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]       = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening] = ImVec4(0.80, 0.80, 0.80, 0.35)
end


function theme5()
	    imgui.SwitchContext()
	    local style = imgui.GetStyle()
	    local colors = style.Colors
	    local clr = imgui.Col
	    local ImVec4 = imgui.ImVec4

			style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

	    colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
	    colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
	    colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
	    colors[clr.ChildWindowBg]          = ImVec4(0.10, 0.10, 0.10, 1.00)
	    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00)
	    colors[clr.Border]                 = ImVec4(0.70, 0.70, 0.70, 0.40)
	    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	    colors[clr.FrameBg]                = ImVec4(0.15, 0.15, 0.15, 1.00)
	    colors[clr.FrameBgHovered]         = ImVec4(0.19, 0.19, 0.19, 0.71)
	    colors[clr.FrameBgActive]          = ImVec4(0.34, 0.34, 0.34, 0.79)
	    colors[clr.TitleBg]                = ImVec4(0.00, 0.69, 0.33, 0.80)
	    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.74, 0.36, 1.00)
	    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.69, 0.33, 0.50)
	    colors[clr.MenuBarBg]              = ImVec4(0.00, 0.80, 0.38, 1.00)
	    colors[clr.ScrollbarBg]            = ImVec4(0.16, 0.16, 0.16, 1.00)
	    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 0.82, 0.39, 1.00)
	    colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 1.00, 0.48, 1.00)
	    colors[clr.ComboBg]                = ImVec4(0.20, 0.20, 0.20, 0.99)
	    colors[clr.CheckMark]              = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.SliderGrab]             = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.77, 0.37, 1.00)
	    colors[clr.Button]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.ButtonHovered]          = ImVec4(0.00, 0.82, 0.39, 1.00)
	    colors[clr.ButtonActive]           = ImVec4(0.00, 0.87, 0.42, 1.00)
	    colors[clr.Header]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.HeaderHovered]          = ImVec4(0.00, 0.76, 0.37, 0.57)
	    colors[clr.HeaderActive]           = ImVec4(0.00, 0.88, 0.42, 0.89)
	    colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.40)
	    colors[clr.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.60)
	    colors[clr.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 0.80)
	    colors[clr.ResizeGrip]             = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.ResizeGripHovered]      = ImVec4(0.00, 0.76, 0.37, 1.00)
	    colors[clr.ResizeGripActive]       = ImVec4(0.00, 0.86, 0.41, 1.00)
	    colors[clr.CloseButton]            = ImVec4(0.00, 0.82, 0.39, 1.00)
	    colors[clr.CloseButtonHovered]     = ImVec4(0.00, 0.88, 0.42, 1.00)
	    colors[clr.CloseButtonActive]      = ImVec4(0.00, 1.00, 0.48, 1.00)
	    colors[clr.PlotLines]              = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.74, 0.36, 1.00)
	    colors[clr.PlotHistogram]          = ImVec4(0.00, 0.69, 0.33, 1.00)
	    colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.80, 0.38, 1.00)
	    colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.69, 0.33, 0.72)
	    colors[clr.ModalWindowDarkening]   = ImVec4(0.17, 0.17, 0.17, 0.48)
	end


function theme6()
imgui.SwitchContext()
local style  = imgui.GetStyle()
local colors = style.Colors
local clr    = imgui.Col
local ImVec4 = imgui.ImVec4

style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

colors[clr.FrameBg]                = ImVec4(0.76, 0.6, 0, 0.74)--
colors[clr.FrameBgHovered]         = ImVec4(0.84, 0.68, 0, 0.83)--
colors[clr.FrameBgActive]          = ImVec4(0.92, 0.77, 0, 0.87)--
colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)--
colors[clr.TitleBgActive]          = ImVec4(0.92, 0.77, 0, 0.85)--
colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)--
colors[clr.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00)
colors[clr.SliderGrab]             = ImVec4(0.84, 0.68, 0, 1.00)
colors[clr.SliderGrabActive]       = ImVec4(0.92, 0.77, 0, 1.00)
colors[clr.Button]                 = ImVec4(0.76, 0.6, 0, 0.85)
colors[clr.ButtonHovered]          = ImVec4(0.84, 0.68, 0, 1.00)
colors[clr.ButtonActive]           = ImVec4(0.92, 0.77, 0, 1.00)
colors[clr.Header]                 = ImVec4(0.84, 0.68, 0, 0.75)
colors[clr.HeaderHovered]          = ImVec4(0.84, 0.68, 0, 0.90)
colors[clr.HeaderActive]           = ImVec4(0.92, 0.77, 0, 1.00)
colors[clr.Separator]              = colors[clr.Border]
colors[clr.SeparatorHovered]       = ImVec4(0.84, 0.68, 0, 0.78)
colors[clr.SeparatorActive]        = ImVec4(0.84, 0.68, 0, 1.00)
colors[clr.ResizeGrip]             = ImVec4(0.76, 0.6, 0, 0.25)
colors[clr.ResizeGripHovered]      = ImVec4(0.84, 0.68, 0, 0.67)
colors[clr.ResizeGripActive]       = ImVec4(0.92, 0.77, 0, 0.95)
colors[clr.TextSelectedBg]         = ImVec4(0.52, 0.34, 0, 0.85)
colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
colors[clr.ComboBg]                = colors[clr.PopupBg]
colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme7() -- стиль имгуи
    imgui.SwitchContext()
    local style  = imgui.GetStyle()
    local colors = style.Colors
    local clr    = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

		style.WindowRounding = 1.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 0.0
style.FrameRounding = 0.0
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0

    colors[clr.Text]                 = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]         = ImVec4(0.73, 0.75, 0.74, 1.00)
    colors[clr.WindowBg]             = ImVec4(0.09, 0.09, 0.09, 0.94)
    colors[clr.ChildWindowBg]        = ImVec4(10.00, 10.00, 10.00, 0.01)
    colors[clr.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]               = ImVec4(0.20, 0.20, 0.20, 0.50)
    colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]              = ImVec4(0.00, 0.39, 1.00, 0.65)
    colors[clr.FrameBgHovered]       = ImVec4(0.11, 0.40, 0.69, 1.00)
    colors[clr.FrameBgActive]        = ImVec4(0.11, 0.40, 0.69, 1.00)
    colors[clr.TitleBg]              = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.TitleBgActive]        = ImVec4(0.00, 0.24, 0.54, 1.00)
    colors[clr.TitleBgCollapsed]     = ImVec4(0.00, 0.22, 1.00, 0.67)
    colors[clr.MenuBarBg]            = ImVec4(0.08, 0.44, 1.00, 1.00)
    colors[clr.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]        = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]  = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.ComboBg]              = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]            = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.SliderGrab]           = ImVec4(0.34, 0.67, 1.00, 1.00)
    colors[clr.SliderGrabActive]     = ImVec4(0.84, 0.66, 0.66, 1.00)
    colors[clr.Button]               = ImVec4(0.00, 0.39, 1.00, 0.65)
    colors[clr.ButtonHovered]        = ImVec4(0.00, 0.64, 1.00, 0.65)
    colors[clr.ButtonActive]         = ImVec4(0.00, 0.53, 1.00, 0.50)
    colors[clr.Header]               = ImVec4(0.00, 0.62, 1.00, 0.54)
    colors[clr.HeaderHovered]        = ImVec4(0.00, 0.36, 1.00, 0.65)
    colors[clr.HeaderActive]         = ImVec4(0.00, 0.53, 1.00, 0.00)
    colors[clr.Separator]            = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.SeparatorHovered]     = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.SeparatorActive]      = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.ResizeGrip]           = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.ResizeGripHovered]    = ImVec4(0.84, 0.66, 0.66, 0.66)
    colors[clr.ResizeGripActive]     = ImVec4(0.84, 0.66, 0.66, 0.66)
    colors[clr.CloseButton]          = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.CloseButtonHovered]   = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]    = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]       = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening] = ImVec4(0.80, 0.80, 0.80, 0.35)
end
