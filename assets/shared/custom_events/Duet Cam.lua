local ogZoom
function onCreate()
    ogZoom = getProperty('camGame.zoom')
end

function onEvent(name, value1, value2)
    if name == "Duet Cam" then
        if value1 == 'on' then  
            triggerEvent('Camera Follow Pos', '800', '600')
            doTweenZoom('duetzoom', 'camGame', ogZoom - 0.13, 1.5, 'sineInOut')
            debugPrint(value1)
        elseif value1 == 'fast' then
            triggerEvent('Camera Follow Pos', '1200', '300')
            doTweenZoom('duetzoom', 'camGame', ogZoom - 0.13, 0.75, 'sineInOut')
        elseif value1 == 'off' then
            triggerEvent('Camera Follow Pos', "", "")
            setProperty("defaultCamZoom", ogZoom) 
        end
    end
end

function onTweenCompleted(name)
	if name == 'duetzoom' then
		setProperty("defaultCamZoom", getProperty('camGame.zoom')) 
	end
end