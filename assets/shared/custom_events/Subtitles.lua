-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Subtitles' then
         setTextString('subtitle', value1)
         setTextColor('subtitle', value2)
         runTimer('subtitlefade', 2, 1)
	end
end


function onCreate()
    fade = 0
    canFade = false
    makeLuaText('subtitle', '', 400, 445, 500)
    addLuaText('subtitle')
    setTextSize('subtitle', 60)
end

function onTimerCompleted(tag)
    if tag == 'subtitlefade' then
        canFade = true
    end
end

function onUpdate(elapsed)
    if canFade then
        fade = fade + elapsed * 100 
        if fade > 200 then
            setTextString('subtitle', '')
            fade = 0 -- Reset fade value
            canFade = false 
        end
    end
end