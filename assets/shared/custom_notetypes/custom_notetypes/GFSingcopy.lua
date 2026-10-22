

function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
    
    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GFSingcopy' then -- try name in file in same name (in lua)
    
        setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0.5);
    end
    end
    end
    
    function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if noteType == 'GFSingcopy' then
        doTweenAlpha('higf','gf',0.5,0.2)
        doTweenX('hihigf','gf',getProperty('dad.x')+400,0.35,'sineOut')
        cancelTween('gfgoodbye')
        runTimer('byegf',0.15)
            if noteData == 0 then
    triggerEvent('Play Animation','singLEFT','gf')
            end
            if noteData == 1 then
    triggerEvent('Play Animation','singDOWN','gf')
            end
            if noteData == 2 then
    triggerEvent('Play Animation','singUP','gf')
            end
            if noteData == 3 then
    triggerEvent('Play Animation','singRIGHT','gf')
            end
        end
    end

    function onTimerCompleted(t)
    if t == 'byegf' then
        doTweenAlpha('gfgoodbye','gf',0,0.105)
    elseif t == 'byebyescsle' then
        	doTweenX('scalewoah3w', 'dad.scale',getProperty('dad.scale.x')-0.1,0.4,'quadOut')
	doTweenY('scalewoah23w2', 'dad.scale',getProperty('dad.scale.y')-0.1,0.4,'quadOut')
    end
end

function onUpdate(elapsed)
if getProperty('gf.alpha') == 0 then
setProperty('gf.x',getProperty('dad.x')+100)
end
end

function onEvent(name,v1)
if name == 'Change Character' then
    setProperty('gf.x',getProperty('dad.x')+100)
    setProperty('gf.alpha',0)
elseif name == 'funnyscale' then
    runTimer('byebyescsle',0.05)
scaleObject('dad',getProperty('dad.scale.x')+0.1,getProperty('dad.scale.y')+0.1)
end
end


function onPause()
setProperty('camGame.angle',0)
end

