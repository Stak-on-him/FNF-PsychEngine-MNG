
local HudPieces = {'healthBarBG','healthBar','scoreTxt','iconP1','iconP2','timeBar','timeBarBG','timeTxt'}

function onCreatePost()
    
    makeLuaSprite('UpperBar', 'empty', -110, -350)
    makeGraphic('UpperBar', 1500, 350, '000000')
    setObjectCamera('UpperBar', 'HUD')
    addLuaSprite('UpperBar', false)


    makeLuaSprite('LowerBar', 'empty', -110, 720)
    makeGraphic('LowerBar', 1500, 350, '000000')
    setObjectCamera('LowerBar', 'HUD')
    addLuaSprite('LowerBar', false)
end

function onEvent(name, value1, value2)
    if name == 'Better Cinematics' then
        local Speed = tonumber(value1) or 1
        local Distance = tonumber(value2) or 0
        
        if Distance > 0 then
        
            doTweenY('Cinematics1', 'UpperBar', -350 + Distance, Speed, 'QuadOut')
            doTweenY('Cinematics2', 'LowerBar', 720 - Distance, Speed, 'QuadOut')

            for i = 1, #HudPieces do
                doTweenAlpha('AlphaHUD'..i, HudPieces[i], 0, Speed - 0.1)
            end
        else
           
            doTweenY('Cinematics1', 'UpperBar', -350, Speed, 'QuadIn')
            doTweenY('Cinematics2', 'LowerBar', 720, Speed, 'QuadIn')

            for i = 1, #HudPieces do
                doTweenAlpha('AlphaHUD'..i, HudPieces[i], 1, Speed + 0.1)
            end
        end
    end
end