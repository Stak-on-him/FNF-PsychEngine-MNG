
local DISABLE_RATINGS = true
local DISABLE_COMBO_NUMBERS = true
local DISABLE_COMBO_TEXT = true
local FORCE_EVERY_FRAME = true
local DEBUG = false


local ratingNames = {'sick','good','bad','shit'}
local lastCombo = 0


local function log(txt)
    if DEBUG then
        debugPrint('[GLOBAL HUD DISABLER] ' .. txt)
    end
end


local function engineDisable()
    if DISABLE_RATINGS then
        setProperty('showRating', false)
    end

    if DISABLE_COMBO_NUMBERS then
        setProperty('showComboNum', false)
    end

    if DISABLE_COMBO_TEXT then
        setProperty('showCombo', false)
    end
end


local function hideSprite(tag)
    if getProperty(tag .. '.exists') ~= false then
        setProperty(tag .. '.visible', false)
        setProperty(tag .. '.alpha', 0)
        setProperty(tag .. '.scale.x', 0.0001)
        setProperty(tag .. '.scale.y', 0.0001)
    end
end

local function hardWipe()
    for i = 1, #ratingNames do
        hideSprite(ratingNames[i])
    end

    hideSprite('combo')

    for i = 0, 9 do
        hideSprite('num' .. i)
    end
end

function onCreate()
    log('Global HUD disabler loaded')
    engineDisable()
end

function onCreatePost()
    engineDisable()
    hardWipe()
end


function goodNoteHit()
    engineDisable()
    hardWipe()
end

function opponentNoteHit()
    engineDisable()
    hardWipe()
end


function onUpdateScore()
    if getProperty('combo') ~= lastCombo then
        lastCombo = getProperty('combo')
        engineDisable()
        hardWipe()
    end
end


function onUpdate(elapsed)
    if FORCE_EVERY_FRAME then
        engineDisable()
        hardWipe()
    end
end


function onEvent()
    engineDisable()
    hardWipe()
end

function onPause()
    engineDisable()
    hardWipe()
end

function onResume()
    engineDisable()
    hardWipe()
end


function onTweenCompleted()
    engineDisable()
    hardWipe()
end


function onEndSong()
    engineDisable()
    hardWipe()
end

function onGameOver()
    engineDisable()
    hardWipe()
    return Function_Continue
end
