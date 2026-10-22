val = (screenWidth/1.8) -- donde terminará el efecto
trailAlpha = 0.7 -- alpha constante para los trails
defaultSpeed = 4 -- velocidad por defecto
defaultEase = 'cubeOut' -- ease por defecto

function onCreate()
    OhNoMyPenis('coolbf', 'boyfriend', screenWidth + 50, yDe, 1.5)
    OhNoMyPenis('cooldad', 'dad', (-xDe) - 50, yDe, 1.5)
end

function OhNoMyPenis(cool, char, x, y, scale)
    xDe = getProperty(char..'.width')
    yDe = screenHeight * 0.3
    
    makeAnimatedLuaSprite(cool, getProperty(char..'.imageFile'), x, y)
    scaleObject(cool, getProperty(char..'.scale.x') * scale, getProperty(char..'.scale.y') * scale)
    setProperty(cool..'.camera', instanceArg('camOther'), false, true)
    setProperty(cool..'.alpha', 0)
    addLuaSprite(cool, true)
end

function onUpdate()
    updateTrail('coolbf', 'boyfriend')
    updateTrail('cooldad', 'dad')
end

function updateTrail(cool, char)
    if getProperty(cool..'.alpha') > 0 then
        setProperty(cool..'.animation.frameName', getProperty(char..'.animation.frameName'))
        setProperty(cool..'.offset.x', getProperty(char..'.offset.x'))
        setProperty(cool..'.offset.y', getProperty(char..'.offset.y'))
        setProperty(cool..'.flipX', getProperty(char..'.flipX'))
    end
end

function onEvent(name, value1, value2)
    if name == 'Change Character' then
        OhNoMyPenis('coolbf', 'boyfriend', screenWidth + 50, yDe, 1.5)
        OhNoMyPenis('cooldad', 'dad', (-xDe) - 50, yDe, 1.5)
    end
    if name == 'GhostFX' then
        target = value1:lower() or 'both'
        speed, ease = parseEffectParams(value2)
        
        dur = (stepCrochet/1000) * speed
        
        if target == 'bf' or target == 'both' then
            CoolEffect('coolbf', 'boyfriend', dur, ease, trailAlpha)
        end
        
        if target == 'dad' or target == 'both' then
            CoolEffect('cooldad', 'dad', dur, ease, trailAlpha)
        end
    end
end

function parseEffectParams(paramStr)
    speed = tonumber(paramStr:match('^(%d+)')) or defaultSpeed
    ease = paramStr:match(',(%a+)') or defaultEase
    return speed, ease
end

function CoolEffect(cool, char, dur, ass, alpha)
    setProperty(cool..'.alpha', alpha)
    setProperty('camOther.alpha', 1)
    
    startX = cool == 'coolbf' and (screenWidth + 50) or (-xDe - 50)
    setProperty(cool..'.x', startX)
    setProperty(cool..'.y', yDe)
    
    moveDistance = cool == 'coolbf' and -val or val
    
    doTweenAlpha(cool..'A', cool, 0, dur, 'sineIn')
    doTweenX(cool..'X', cool, getProperty(cool..'.x') + moveDistance, dur, ass)
end