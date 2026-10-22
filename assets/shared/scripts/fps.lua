--{script made by: bastixtroller123, AdrianSuperPlay Edit :p}--
lockFps = 60 -- 60 recommended

-- Box padding
local boxPaddingX = 16
local boxPaddingY = 5

function onCreate()
    setPropertyFromClass('Main','fpsVar.visible',false)

    math.randomseed(os.time() + os.clock() * 1000)

    -- BACKGROUND BOX
    makeLuaSprite("nbg2", "", 6, 2)
    makeGraphic('nbg2', 1, 26, '000000')
    setObjectCamera('nbg2', 'other')
    setProperty('nbg2.alpha', 0.6) -- more visible
    addLuaSprite('nbg2', true)

    -- TEXT
    makeLuaText('FPS', "FPS:", 0, 10, 6)
    setTextSize('FPS', 18) -- slightly smaller
    setTextBorder('FPS', 0)
    setTextFont('FPS','OpenSans-SemiBold.ttf')
    setObjectCamera('FPS', 'other')
    addLuaText('FPS')
end

function onUpdate(elapsed)
    local FPSnumber = getPropertyFromClass("Main", "fpsVar.currentFPS")
    local memoryUsed = getPropertyFromClass("Main", "fpsVar.memoryMegas") / 1000000

    setTextString(
        'FPS',
        'FPS: '..FPSnumber.."  -  MEM: "..string.format("%.2f MB", memoryUsed)
    )

    local textWidth = getTextWidth('FPS')
    local textHeight = getProperty('FPS.height')

    -- Resize box
    setGraphicSize(
        'nbg2',
        textWidth + boxPaddingX * 2,
        textHeight + boxPaddingY * 2
    )

    -- Align box
    setProperty('nbg2.x', getProperty('FPS.x') - boxPaddingX)
    setProperty('nbg2.y', getProperty('FPS.y') - boxPaddingY)
end

function onDestroy()
    setPropertyFromClass('Main','fpsVar.visible',true)
end
