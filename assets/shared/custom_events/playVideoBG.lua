local backgroundVideoActive = false

local function videoThing(a, b, c, d, e, f)
    startVideo(a, b, c, d, e)
    if not f then return end
    setObjectCamera('videoCutscene', 'camGame')
    setObjectOrder('videoCutscene', 2)
    scaleObject("videoCutscene", 5, 5)
end

function onCreate()

  for i = 0, getProperty('eventNotes.length')-1 do
    if getProperty('eventNotes['..i..'].event') == 'playVideo' then
      startVideo(getProperty('eventNotes['..i..'].value1'), false, true, false, false)
    end
  end
end

function onEvent(n, v1, v2)
  if n == 'playVideoBG' then
    videoThing(v1, false, true, nil, nil, v2 == '')
  elseif n == 'playVideoBackground' then
    -- Запускаем фоновое видео
    startBackgroundVideo(v1)
  end
end

function startBackgroundVideo(videoName)
    backgroundVideoActive = true
    startVideo(videoName, false, false, false, false)
    runTimer('setupBackgroundVideo', 0.1)
end

function onTimerCompleted(tag)
    if tag == 'setupBackgroundVideo' and backgroundVideoActive then
        if getProperty('videoCutscene') ~= nil then
            -- Растягиваем видео на весь экран
            setObjectCamera('videoCutscene', 'camGame')
            setProperty('videoCutscene.alpha', 1)
            
            -- Принудительно растягиваем и настраиваем повторение через Haxe
            runHaxeCode([[
                try {
                    var video = game.getLuaObject('videoCutscene');
                    if (video != null) {
                        // Растягиваем на весь экран
                        video.setGraphicSize(FlxG.width, FlxG.height);
                        video.updateHitbox();
                        video.screenCenter();
                        
                        // Включаем повторение
                        if (video.bitmap != null && video.bitmap.video != null) {
                            video.bitmap.video.repeat = true;
                        }
                    }
                } catch(e) {}
            ]])
        else
            -- Пытаемся снова
            runTimer('setupBackgroundVideo', 0.1)
        end
    end
end

-- Постоянная проверка и поддержание видео
function onUpdate(elapsed)
    if backgroundVideoActive and getProperty('videoCutscene') ~= nil then
        runHaxeCode([[
            try {
                var video = game.getLuaObject('videoCutscene');
                if (video != null) {
                    // Поддерживаем растяжение
                    video.setGraphicSize(FlxG.width, FlxG.height);
                    video.updateHitbox();
                    video.screenCenter();
                    
                    // Проверяем и перезапускаем видео если нужно
                    if (video.bitmap != null && video.bitmap.video != null) {
                        if (video.bitmap.video.ended || !video.bitmap.video.playing) {
                            video.bitmap.video.repeat = true;
                            video.bitmap.video.restart();
                        }
                    }
                }
            } catch(e) {}
        ]])
    end
    
end

-- Останавливаем видео при завершении уровня
function onDestroy()
    if backgroundVideoActive then
        runHaxeCode([[
            try {
                var video = game.getLuaObject('videoCutscene');
                if (video != null && video.bitmap != null && video.bitmap.video != null) {
                    video.bitmap.video.stop();
                }
            } catch(e) {}
        ]])
        backgroundVideoActive = false
    end
end

function onPause()
  if getProperty("videoCutscene") == nil then return end
  callMethod("videoCutscene.pause")

  if callMethodFromClass("flixel.FlxG", "signals.focusLost.has", {instanceArg("videoCutscene.videoSprite.pause")}) then
    callMethodFromClass("flixel.FlxG", "signals.focusLost.remove", {instanceArg("videoCutscene.videoSprite.pause")})
  end

  if callMethodFromClass("flixel.FlxG", "signals.focusGained.has", {instanceArg("videoCutscene.videoSprite.resume")}) then
    callMethodFromClass("flixel.FlxG", "signals.focusGained.remove", {instanceArg("videoCutscene.videoSprite.resume")})
  end
end

function onResume()
  if getProperty("videoCutscene") == nil then return end
  callMethod("videoCutscene.resume")

  if not callMethodFromClass("flixel.FlxG", "signals.focusLost.has", {instanceArg("videoCutscene.videoSprite.pause")}) then
    callMethodFromClass("flixel.FlxG", "signals.focusLost.add", {instanceArg("videoCutscene.videoSprite.pause")})
  end

  if not callMethodFromClass("flixel.FlxG", "signals.focusGained.has", {instanceArg("videoCutscene.videoSprite.resume")}) then
    callMethodFromClass("flixel.FlxG", "signals.focusGained.add", {instanceArg("videoCutscene.videoSprite.resume")})
  end
end