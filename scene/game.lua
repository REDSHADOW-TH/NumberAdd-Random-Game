composer = require('composer')
widget = require('widget')

local scene = composer.newScene()

local sceneNumberMax = 10
local sceneNumber = 1

local score = 0

-- local secondMax = 10
-- local second = 0

local number1 = 0
local number2 = 0


local numberPrimary = 0

local numberSubmit = native.newTextField(
    display.contentCenterX + 70, display.contentCenterY,70, 50
)
numberSubmit.inputType = 'number'


local function randomNumber()
    number1 = math.random(1, 50)
    number2 = math.random(1, 50)
    number1Show.text = number1
    numberPrimary = number1 + number2
    numPrimary.text = numberPrimary
end

local function onSubmit()
    if numberSubmit.text ~= nil and numberSubmit.text ~= '' then
        if number2 == tonumber(numberSubmit.text) then
            score = score + 1
            collect.isVisible = true
        else
            wrong.isVisible = true
        end
        timer.performWithDelay(450, function(e)
            if sceneNumber == sceneNumberMax then
                if numberSubmit then
                    numberSubmit:removeSelf()
                    numberSubmit = nil
                end
                composer.gotoScene('scene.end', {
                    effect = 'fade', time = 450, params = { totalScore = score }
                })
                composer.removeScene('scene.game')
            else
                if sceneNumber <= sceneNumberMax then
                    sceneNumber = sceneNumber + 1
                    numberSubmit.text = ''
                    collect.isVisible = false
                    wrong.isVisible = false
                    randomNumber()
                    sceneShow.text = sceneNumber..'/'..sceneNumberMax
                    scoreShow.text = 'คะเเนน: '..score
                end
            end
            
        end)
        
    end
    
end


function scene:create(e)
    local bg = display.newImage('res/images/bg.jpg', display.contentWidth, display.contentHeight)
    bg.x = display.contentCenterX / 2
    bg.y = display.contentCenterY / 2

    sceneShow = display.newText({
        text = sceneNumber..'/'..sceneNumberMax,
        x = display.safeScreenOriginX + 35,
        y = display.safeScreenOriginY + 25,
        font = native.systemFont,
        fontSize = 25
    })

    scoreShow = display.newText({
        text = 'คะเเนน: '..score,
        x = display.safeScreenOriginX + 35,
        y = display.safeScreenOriginY + 25,
        font = native.systemFont,
        fontSize = 25
    })

    scoreShow.x = display.contentWidth - (scoreShow.width - 35)

    
    local btnSubmit = widget.newButton({
        label = 'ตอบ',
        shape = 'react',
        fillColor = { default = {46/255, 204/255, 113/255, 1}, over = {39/255, 174/255, 96/255, 1} },
        labelColor = { default = {1, 1, 1, 1} },
        onEvent = function(e)
            if 'ended' == e.phase then
                onSubmit()
            end
        end
    })
    btnSubmit.x = display.contentCenterX
    btnSubmit.y = display.contentCenterY + 150


    number1Show = display.newText({
        text = number1,
        x = display.contentCenterX - 70,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 50
    })

    local t1 = display.newText({
        text = '+',
        x = display.contentCenterX,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 30
    })

    

    numPrimary = display.newText({
        text = numberPrimary,
        x = display.contentCenterX,
        y = display.contentCenterY - 150,
        font = native.systemFont,
        fontSize = 145
    })
    numPrimary:setFillColor(230/255, 126/255, 34/255, 1)

    
    collect = display.newText({
        text = 'คำตอบถูก',
        x = display.contentCenterX,
        y = display.contentCenterY + 50,
        font = native.systemFont,
        fontSize = 15
    })
    collect:setFillColor(68/255, 189/255, 50/255, 1)
    collect.isVisible = false

    
    wrong = display.newText({
        text = 'คำตอบผิด',
        x = display.contentCenterX,
        y = display.contentCenterY + 50,
        font = native.systemFont,
        fontSize = 15
    })
    wrong:setFillColor(1, 0, 0, 1)
    wrong.isVisible = false


    self.view:insert(bg)
    self.view:insert(sceneShow)
    self.view:insert(scoreShow)
    self.view:insert(t1)
    self.view:insert(btnSubmit)
    self.view:insert(number1Show)
    self.view:insert(numberSubmit)
    self.view:insert(numPrimary)
    self.view:insert(collect)
    self.view:insert(wrong)
end


function scene:show(e)
    randomNumber()
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