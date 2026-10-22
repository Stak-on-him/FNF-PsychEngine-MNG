trailEnabledDad = false
trailEnabledBF = false

local trailLength = 12 -- Cantidad de trails válidos
local fadeTime = 0.5 -- Tiempo de desvanecimiento (y desplazamiento)
local v = -100 -- Valor de desplazamiento
local eas = '' -- Tipo de desplazamiento
local c = 100 -- Color intensity
local blend = 'add' -- blend
local altNoteTypes = {'alt', 'musthit', 'special'} -- Tipos de notas que se consideran ALT

local trailCounters = { Dad = 0, BF = 0 }

function getIconColor(chr)
    local arr = getProperty(chr .. ".healthColorArray")
    local intensity = 255 - math.floor((c / 100) * 255)
    return getColorFromHex(string.format('%.2x%.2x%.2x', 
        math.min(arr[1] + intensity, 255), 
        math.min(arr[2] + intensity, 255), 
        math.min(arr[3] + intensity, 255)))
end

function onEvent(name, value1, value2)
    if name == "Toggle Trail" then
        trailEnabledDad = value1 == '1'
        trailEnabledBF = value2 == '1'
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if trailEnabledBF then 
        local isAlt = isNoteAlt(noteType)
        createTrailFrame('BF', direction, isAlt) 
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if trailEnabledDad then 
        local isAlt = isNoteAlt(noteType)
        createTrailFrame('Dad', direction, isAlt) 
    end
end

function isNoteAlt(noteType)
    if not noteType or noteType == '' then return false end
    for _, altType in ipairs(altNoteTypes) do
        if string.lower(noteType) == string.lower(altType) then
            return true
        end
    end
    return false
end

function createTrailFrame(tag, direction, isAlt)
    local char = tag == 'BF' and 'boyfriend' or 'dad'
    trailCounters[tag] = trailCounters[tag] + 1
    
    -- Verificar si el personaje está cantando
    local animName = getProperty(char..'.animation.curAnim.name')
    if not string.find(animName, 'sing') then return end
    
    -- Si es una nota ALT, usar la animación ALT si existe
    if isAlt then
        local altAnim = animName..'-alt'
        if getProperty(char..'.animation.curAnim.name') ~= altAnim and getProperty(char..'.animation.offsets['..altAnim..']') ~= nil then
            animName = altAnim
        end
    end
    
    local trailTag = 'psychicTrail'..tag..trailCounters[tag]
    makeAnimatedLuaSprite(trailTag, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
    
    -- Copiar propiedades del personaje
    for _, prop in ipairs({'offset.x', 'offset.y', 'scale.x', 'scale.y', 'flipX', 'antialiasing'}) do
        setProperty(trailTag..'.'..prop, getProperty(char..'.'..prop))
    end
    
    -- Configurar trail
    setProperty(trailTag..'.alpha', 0.8 * getProperty(char..'.alpha'))
    setProperty(trailTag .. '.color', getIconColor(char))
    setBlendMode(trailTag, blend)
    
    -- Añadir animación
    addAnimationByPrefix(trailTag, 'stuff', getProperty(char..'.animation.frameName'), 0, false)
    addLuaSprite(trailTag, false)
    setObjectOrder(trailTag, getObjectOrder(char..'Group') - 0.1)
    
    -- Ajustar desplazamiento para notas ALT
    local altMultiplier = isAlt and 1.5 or 1
    doTweenX(trailTag..'fadeX', trailTag, getProperty(char..'.x') + obtenerX(direction) * altMultiplier, fadeTime, eas)
    doTweenY(trailTag..'fadeY', trailTag, getProperty(char..'.y') + obtenerY(direction) * altMultiplier, fadeTime, eas)
    doTweenAlpha(trailTag..'Fade', trailTag, 0, fadeTime, 'cubeIn')
end

function obtenerX(tecla)
    local moveX = {-v , 0, 0, v}
    return moveX[tecla + 1]
end

function obtenerY(tecla)
    local moveY = {0 , v, -v, 0}
    return moveY[tecla + 1]
end

function onTweenCompleted(tag)
    if string.match(tag, 'Fade') then
        removeLuaSprite(string.gsub(tag, 'Fade', ''), true)
    end
end