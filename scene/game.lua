composer = require('composer')
widget = require('widget')

scene = composer.newScene()

function scene:create(e)
    display.setDefault('background', .6, .2, .6)
    t1 = display.newText({
        text = 'Game Scene',
        x = display.contentCenterX,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 50
    })
    btnExit = widget.newButton({
        label = 'Exit',
        shape = 'react',
        fillColor = { default = {1, 0, 0, 1}, over = {1, 0, 0, 1} },
        labelColor = { default = {1, 1, 1, 1} },
        onEvent = function(e)
            if 'ended' == e.phase then
                composer.gotoScene('scene.start', {
                    effect = 'fade', time = 300
                })
            end
        end
    })
    btnExit.x = display.contentCenterX
    btnExit.y = display.contentCenterY + 150
    self.view:insert(t1)
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