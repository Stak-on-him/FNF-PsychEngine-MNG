local logs = {}
local maxLines = 200
local showDebug = false
local scroll = 0
local linesVisible = 14

local misses = 0
local botMisses = 0
local score = 0
local fps = 0
local memMB = 0

local botplay = false
local lastBotplay = false

-- cleanup stuff
local CLEAN_TIME = 15
local cleanTimer = 'mem_clean'
local cleanCount = 0
local lastClean = 0
local sprites = {}

-- memory spike tracking
local lastMem = 0
local spikeWarn = 12
local spikeHard = 32
local spikeDelay = 4
local lastSpike = 0
local spikes = 0

--------------------------------------------------

local function killStuff()
    cancelTween('')
    cancelTimer('')
end

local function clearSprites()
    for i = #sprites, 1, -1 do
        local s = sprites[i]
        if luaSpriteExists(s) then
            removeLuaSprite(s, true)
        end
        sprites[i] = nil
    end
end

function trackSprite(tag)
    sprites[#sprites + 1] = tag
end

function doCleanup()
    killStuff()
    clearSprites()
    collectgarbage('collect')

    cleanCount = cleanCount + 1
    lastClean = os.clock()
    log('cleanup #' .. cleanCount)
end

--------------------------------------------------

local function checkSpikes()
    if lastMem == 0 then
        lastMem = memMB
        return
    end

    local diff = memMB - lastMem
    local t = os.clock()

    if diff >= spikeWarn and t - lastSpike >= spikeDelay then
        spikes = spikes + 1
        lastSpike = t

        log(string.format('memory spike +%.1f MB', diff))

        if diff >= spikeHard then
            log('forcing cleanup (big spike)')
            doCleanup()
        end
    end

    lastMem = memMB
end

--------------------------------------------------

function onCreate()
    makeLuaSprite('dbg_bg', nil, 30, 30)
    makeGraphic('dbg_bg', screenWidth - 500, 380, '1E1E1E')
    setProperty('dbg_bg.alpha', 0)
    setObjectCamera('dbg_bg', 'other')
    addLuaSprite('dbg_bg', true)

    makeLuaText('dbg_txt', '', screenWidth - 100, 50, 50)
    setTextSize('dbg_txt', 14)
    setTextAlignment('dbg_txt', 'left')
    setProperty('dbg_txt.alpha', 0)
    setObjectCamera('dbg_txt', 'other')
    addLuaText('dbg_txt')

    runTimer(cleanTimer, CLEAN_TIME, 0)

    log('debug overlay ready')
end

--------------------------------------------------

function onUpdate(elapsed)
    if keyboardJustPressed('T') then
        toggleDebug()
    end

    if keyJustPressed('debug_9') then
        doCleanup()
    end

    updateBotplay()
    updateFPS()
    updateMemory()
    checkSpikes()

    if showDebug then
        handleScroll()
        updateScore()
        drawOverlay()
    end
end

function onTimerCompleted(tag)
    if tag == cleanTimer then
        doCleanup()
    end
end

--------------------------------------------------

function updateBotplay()
    botplay = getProperty('cpuControlled') == true
    if botplay ~= lastBotplay then
        log(botplay and 'botplay on' or 'botplay off')
        lastBotplay = botplay
    end
end

function updateFPS()
    local e = getPropertyFromClass('flixel.FlxG', 'elapsed')
    fps = e > 0 and math.floor(1 / e) or 0
end

function updateMemory()
    memMB = collectgarbage('count') / 1024
end

--------------------------------------------------

function drawOverlay()
    local txt = ''
    local from = math.max(1, #logs - linesVisible - scroll + 1)
    local to = math.max(1, #logs - scroll)

    for i = from, to do
        txt = txt .. logs[i] .. '\n'
    end

    local since = lastClean > 0 and (os.clock() - lastClean) or 0

    txt = txt .. string.format(
        '\nBot: %s | Miss: %d | BotMiss: %d | Score: %d' ..
        '\nMem: %.1f MB | FPS: %d' ..
        '\nCleans: %d | Spikes: %d | Last: %.1fs',
        botplay and 'ON' or 'OFF',
        misses,
        botMisses,
        score,
        memMB,
        fps,
        cleanCount,
        spikes,
        since
    )

    setTextString('dbg_txt', txt)
end

--------------------------------------------------

function toggleDebug()
    showDebug = not showDebug
    doTweenAlpha('bgFade', 'dbg_bg', showDebug and 0.6 or 0, 0.2, 'quartOut')
    doTweenAlpha('txtFade', 'dbg_txt', showDebug and 1 or 0, 0.2, 'quartOut')
end

function handleScroll()
    local w = getPropertyFromClass('flixel.FlxG', 'mouse.wheel')
    if w ~= 0 then
        scroll = math.max(0, math.min(scroll - w, #logs - linesVisible))
    end
end

--------------------------------------------------

function log(msg)
    logs[#logs + 1] = os.date('%H:%M:%S') .. ' | ' .. msg
    if #logs > maxLines then
        table.remove(logs, 1)
    end
end

--------------------------------------------------

function noteMiss()
    if botplay then
        botMisses = botMisses + 1
    else
        misses = misses + 1
    end
end

function updateScore()
    score = getProperty('songScore') or 0
end
