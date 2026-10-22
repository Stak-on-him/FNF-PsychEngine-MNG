function onCreate()
    makeLuaSprite('sky', 'terresstra/sky', -870, -350)
    setScrollFactor('sky', 0.1, 1.1)
    addLuaSprite('sky', false)

    makeLuaSprite('cloud', 'terresstra/cloud', -570, -25)
    setScrollFactor('cloud', 0.4, 1)
    addLuaSprite('cloud', false)

    makeAnimatedLuaSprite('ocean', 'terresstra/ocean', -760, 150)
    addAnimationByPrefix('ocean', 'ocean', 'ocean', 24, true)
    setScrollFactor('ocean', 0.8, 0.95)
    addLuaSprite('ocean', false)
    
    makeLuaSprite('hills', 'terresstra/hills', -770, 240)
    setScrollFactor('hills', 1, 0.95)
    addLuaSprite('hills', false)

    makeLuaSprite('ground', 'terresstra/ground', -685, -240)
    setScrollFactor('ground', 0.95, 0.95)
    addLuaSprite('ground', false)
    
    makeAnimatedLuaSprite('crowd', 'terresstra/crowd', -120, 110)
    addAnimationByPrefix('crowd', 'crowd', 'crowd', 24, false)
    setScrollFactor('crowd', 0.95, 0.95)
    addLuaSprite('crowd', false)

    makeLuaSprite('frontplants', 'terresstra/frontplants', -870, 500)
    setScrollFactor('frontplants', 1.15, 0.95)
    addLuaSprite('frontplants', fasle)

    makeLuaSprite('whiteSquare', 'terresstra/whiteSquare', -440, -280)
    setScrollFactor('whiteSquare', 0, 0)
    addLuaSprite('whiteSquare', false)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('crowd', 'crowd', true)
    end
    
    if curBeat <= 640 then
        if curBeat % 4 == 1 then
            objectPlayAnimation('astroGF', 'idle', true)
        end
    end
end

function onStepHit()
    if curStep == 248 then
        addLuaSprite('frontplants', true)
        doTweenAlpha('whiteSquareTween', 'whiteSquare', 1, 0.5, 'linear')
        doTweenAlpha('whiteSquareTween', 'whiteSquare', 0, 0.5, 'linear')
    end
    
    if curStep == 2560 then
        objectPlayAnimation('astroGF', 'cheer', true)
        setProperty('astroGF.x', 560)
    end
end