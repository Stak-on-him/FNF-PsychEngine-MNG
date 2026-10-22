local defaultX = {}
local defaultY = {}

function onSongStart()
    for strum = 0,7 do
        table.insert(defaultX,getPropertyFromGroup('strumLineNotes',strum,'x'))
        table.insert(defaultY,getPropertyFromGroup('strumLineNotes',strum,'y'))
    end
end

function onEvent(n, v1, v2)
    if n ~= 'Middlescroll' or middlescroll then return end
    
    local isOn = (v1 == 'on')
    local duration = tonumber(v2) or 3
    
    for i = 0, 3 do
        local targetAlpha = isOn and 1 or 1
        local targetX = isOn and (defaultX[i+5] - 315) or defaultX[i+5]
        local targetAngle = isOn and -360 or 0
        
        noteTweenAlpha('playerAlpha'..i+4, i+4, targetAlpha, stepCrochet*0.001*duration)
        noteTweenX('playerX'..i+4, i+4, targetX, stepCrochet*0.001*duration, 'cubeInOut')
        noteTweenAngle('playerAngle'..i+4, i+4, targetAngle, stepCrochet*0.001*duration, 'cubeInOut')
        
        local opponentAlpha = isOn and 0.2 or 1
        local opponentX = isOn and (defaultX[i+5] - 315) or defaultX[i+1]
        local opponentAngle = isOn and 360 or 0
        
        noteTweenAlpha('opponentAlpha'..i, i, opponentAlpha, stepCrochet*0.001*duration)
        noteTweenX('opponentX'..i, i, opponentX, stepCrochet*0.001*duration, 'cubeInOut')
        noteTweenAngle('opponentAngle'..i, i, opponentAngle, stepCrochet*0.001*duration, 'cubeInOut')
    end
end