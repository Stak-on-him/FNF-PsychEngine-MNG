function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'visible', false)
    end
end

function onUpdate(elapsed)
    for i = 0, getProperty('notes.length') - 1 do
        
        if not getPropertyFromGroup('notes', i, 'mustPress') then
            
            setPropertyFromGroup('notes', i, 'visible', false)
            
            setPropertyFromGroup('notes', i, 'active', true)
            
    
            setPropertyFromGroup('notes', i, 'ignoreNote', false)
        end
    end
end
