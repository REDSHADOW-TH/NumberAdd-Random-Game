composer = require('composer')

local scene = composer.newScene()

function scene:create(e)
    local scoreParam = e.params.totalScore
    local widget = require('widget')
    local score = display.newText({
        text = 'คะเเนนที่ทำได้: '..scoreParam,
        x = display.contentCenterX,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 30
    })
    local bg = display.newImage('res/images/bg.jpg', display.contentWidth, display.contentHeight)
    bg.x = display.contentCenterX / 2
    bg.y = display.contentCenterY / 2
    local btnHome = widget.newButton({
        label = 'กลับสู่หน้าหลัก',
        shape = 'react',
        fillColor = { default = {0, .7, 0, 1}, over = {0, 1, 0, 1}},
        labelColor = { default = {1, 1, 1, 1} },
        onEvent = function(e)
            if 'ended' == e.phase then
                composer.gotoScene('scene.start', {
                    effect = 'fade', time = 500
                })
                timer.performWithDelay(500, function()
                    composer.removeScene('scene.end')
                end)
            end
        end
    })
    btnHome.x = display.contentCenterX
    btnHome.y = display.contentCenterY + 159
    self.view:insert(bg)
    self.view:insert(score)
    self.view:insert(btnHome)
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