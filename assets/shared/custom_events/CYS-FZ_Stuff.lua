function onEvent(name, value1, value2)
    if name == 'CYS-FZ_Stuff' then
        debugPrint('Static toggle event received: ' .. value1)
        if value1 == 'on' then
            showStaticOverlay()
        elseif value1 == 'off' then
            hideStaticOverlay()
        end
    end
end

function showStaticOverlay()
    if not luaSpriteExists('staticOverlay') then
        makeAnimatedLuaSprite('staticOverlay', 'screenstatic', 0, 0)
        addAnimationByPrefix('staticOverlay', 'static', 'screenSTATIC', 24, true)
        playAnim('staticOverlay', 'static', true)
        setObjectCamera('staticOverlay', 'camOther')
        setProperty('staticOverlay.alpha', 0.4)
        scaleObject('staticOverlay', 2, 2)
        setProperty('staticOverlay.x', 0)
        setProperty('staticOverlay.y', 0)
        addLuaSprite('staticOverlay', true)
    else
        setProperty('staticOverlay.visible', true)
    end
end

function hideStaticOverlay()
    if luaSpriteExists('staticOverlay') then
        setProperty('staticOverlay.visible', false)
    end
end