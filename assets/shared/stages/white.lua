---@diagnostic disable: lowercase-global, undefined-global

function onCreate()
    makeLuaSprite("white", "", -2500, -2500)
    makeGraphic("white", 10000, 10000, "FFFFFF")
    addLuaSprite("white")

    makeLuaSprite("black", "", 0, 0)
    makeGraphic("black", 1280, 720, "000000")
    setObjectCamera("black", "hud")
    addLuaSprite("black")

    makeLuaSprite("hah", "hah", 0, 0)
    setObjectCamera("hah", "other")
    setProperty("hah.alpha", 0)
    addLuaSprite("hah")

    makeAnimatedLuaSprite("bgdudes", "kecksbg", 1440, -170)
    addAnimationByPrefix("bgdudes", "idle", "keckgang", 24, true)
    playAnim("bgdudes", "idle")
    addLuaSprite("bgdudes", false)
end

function onStepHit()
    if curStep == 130 then
        cameraFlash("other", "FFFFFF", 1, true)
        setProperty("black.visible", false)
    elseif curStep == 1792 then
        cameraFlash("other", "FFFFFF", 1, true)
    elseif curStep == 1813 then
        doTweenAlpha("hahTweenAlpha", "hah", 1, 0.25, "circIn")
end
end