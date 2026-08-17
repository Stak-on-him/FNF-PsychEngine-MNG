sss = false
k = 1
lastSection = mustHitSection -- guardamos el estado inicial

function onUpdate()
    if sss and mustHitSection ~= lastSection then
        lastSection = mustHitSection
        triggerSpeed()
    end
end

function triggerSpeed()
    setProperty('cameraSpeed', k*900)
    runTimer('h', 0.1)
end

function onTimerCompleted(n)
    if n == 'h' then
        setProperty('cameraSpeed', k)
    end
end

function onEvent(n,v1)
    if n == 'Speed' then
		k = getProperty('cameraSpeed')
        sss = (v1 == 'on')
    end
end
