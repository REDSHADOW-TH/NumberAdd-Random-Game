composer = require('composer')
widget = require('widget')

local scene = composer.newScene()


local function onStart(e)
    -- if 'ended' == e.phase then
    --     native.showAlert('Start Game', 'Commingsoon.', {'Ok'})
    -- end
    composer.gotoScene('scene.game', {
        effect = 'fade', time = 300
    })
end

local function onAbout(e)
    if 'ended' == e.phase then
        native.showAlert('About', 'เกมบวกเลข\n\nCopyright 2013 REDSHADOWTH\nVersion: 1.0.1\nCreate By : REDSHADOWTH (Phumiphat Jaroenyonwhatthana). ', {'Ok'})
    end
end

local function exitApp(e)
    if 'ended' == e.phase then
        native.showAlert('ออกจากเกม', 'คุณต้องการออกจากเกมใช่หรือไม่ ?', {'ออก', 'ยกเลิก'}, function(e)
            if e.index == 1 then
                native.requestExit()
            end
        end)
    end
end

function scene:create(e)
    local logo = display.newImage('res/images/logo.png', 64, 64)
    logo.x = display.contentCenterX
    logo.y = display.contentCenterY - 120
    local bg = display.newImage('res/images/bg.jpg', display.contentWidth, display.contentHeight)
    bg.x = display.contentCenterX / 2
    bg.y = display.contentCenterY / 2
    local btnStart = widget.newButton({
        label = 'เริ่มเกม',
        shape = 'react',
        fillColor = { default= {46/255, 204/255, 113/255, 1}, over = {46/255, 230/255, 120/255, 1} },
        labelColor = { default = {1, 1, 1, 1} },
        onEvent = onStart
    })
    btnStart.x = display.contentCenterX
    btnStart.y = display.contentCenterY


    local btnAbout = widget.newButton({
        label = 'เกี่ยวกับ',
        shape = 'react',
        fillColor = { default={52/255, 152/255, 219/255, 1}, over = {41/255, 128/255, 185/255, 1} },
        labelColor = { default = {1, 1, 1, 1}},
        onEvent = onAbout
    })
    btnAbout.x = display.contentCenterX
    btnAbout.y = display.contentCenterY + 70


    local btnExit = widget.newButton({
        label = 'ออก',
        shape = 'react',
        fillColor = { default={231/255, 76/255, 60/255, 1}, over = {192/255, 57/255, 43/255, 1} },
        labelColor = { default = {1, 1, 1, 1}},
        onEvent = exitApp
    })
    btnExit.x = display.contentCenterX
    btnExit.y = display.contentCenterY + 140

    self.view:insert(bg)
    self.view:insert(logo)
    self.view:insert(btnStart)
    self.view:insert(btnAbout)
    self.view:insert(btnExit)
end


function scene:show(e)
end


function scene:hide(e)
end

function scene:destroy(e)
end


scene:addEventListener('create', scene)
scene:addEventListener('show', scene)
scene:addEventListener('hide', scene)
scene:addEventListener('destroy', scene)

return scene