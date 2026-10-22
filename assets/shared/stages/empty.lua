function onCreate()
setProperty('camGame.bgColor',-1)
end

function onGameOver()
b()
end

function onDestroy()
b()
end


function b()
setPropertyFromClass('flixel.FlxG', 'camera.bgColor', getColorFromHex('000000'))
end