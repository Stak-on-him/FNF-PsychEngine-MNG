function onCreate()
    setProperty('camGame.bgColor', getColorFromHex('FFFFFF'))
    makeLuaSprite('base', 'bg/graveyard/1', 0, 0)
    makeLuaSprite('part1', 'bg/graveyard/3', 0, 0)
    makeLuaSprite('part2', 'bg/graveyard/2', 0, 0)
    makeLuaSprite('part3', 'bg/graveyard/4', 0, 0)
    
    setProperty('base.x', -850)
    setProperty('base.y', -400)

    scaleObject('base', 1.5, 1.5)
    scaleObject('part3', 1.3, 1.3)

    setScrollFactor('base', 0.5, 0.5);
    setScrollFactor('part1', 1, 1);
    setScrollFactor('part2', 1.1, 1);
    setScrollFactor('part3', 1.1, 1);



    addLuaSprite('base', false)
    addLuaSprite('part1', false)
    addLuaSprite('part2', false)
    addLuaSprite('part3', false)

    makeLuaSprite('blackScreen', 'camGame', -1000, -700)
    makeGraphic('blackScreen', 1980, 1080, '000000') 
    scaleObject('blackScreen', 2.1, 2.1)
    setScrollFactor('blackScreen', 0, 0);
    setObjectCamera('blackScreen', 'camGame')
    setObjectOrder('blackScreen', 10)
    makeLuaSprite('whiteScreen', 'camGame', -1000, -700)
    makeGraphic('whiteScreen', 1980, 1080, '000000') 
    scaleObject('whiteScreen', 2.1, 2.1)
    setScrollFactor('whiteScreen', 0, 0);
    setObjectCamera('whitekScreen', 'camGame')
    setObjectOrder('whiteScreen', 10)
    makeLuaSprite('redScreen', 'camHUD', -1000, -700)
    makeGraphic('redScreen', 1980, 1080, 'ff0000') 
    scaleObject('redScreen', 2.1, 2.1)
    setScrollFactor('redScreen', 0, 0);
    setObjectCamera('redScreen', 'camHUD')
    setObjectOrder('redScreen', 10)
    setProperty('blackScreen.alpha', 0)
    setProperty('whiteScreen.alpha', 0)
    setProperty('redScreen.alpha', 0)
    setProperty('boyfriend.scale.x', 0.9);
    setProperty('boyfriend.scale.y', 0.9);
    setProperty('opponent.scale.x', 1.5);
    setProperty('opponent.scale.y', 1.5);
    setProperty('dad.alpha', 1)
    setProperty('base.alpha', 0)
end

function onUpdate()
    local x = getProperty('base.x')
    local y = getProperty('base.y')
    local scx = getProperty('base.scale.x')
    local scy = getProperty('base.scale.y')

    setProperty('part1.x', x + 1000)
    setProperty('part1.y', y + 60)
    setProperty('part1.scale.x', scx - 0.1)
    setProperty('part1.scale.y', scy)

    setProperty('part2.x', x + 1000)
    setProperty('part2.y', y + 50)
    setProperty('part2.scale.x', scx - 0.1)
    setProperty('part2.scale.y', scy)


    setProperty('part3.x', x + 800)
    setProperty('part3.y', y - 180)

    local props = {'alpha','angle'}

    for _,v in ipairs(props) do
        setProperty('part1.'..v, getProperty('base.'..v))
        setProperty('part2.'..v, getProperty('base.'..v))
        setProperty('part3.'..v, getProperty('base.'..v))
    end
end

function onStepHit()
	if curStep == 1 then
		doTweenAlpha('blackScreen1','blackScreen', 1, 0.1, 'linear');
        setProperty('camHUD.alpha', 0)
        for i = 0, 3 do
            local noteX = getPropertyFromGroup('playerStrums', i, 'x')
            if not middlescroll then
                doTweenX('playerNote' .. i, 'playerStrums.members[' .. i .. ']', noteX + 700, stepCrochet / 1000 * 14, 'quartInOut')
            end
        end
	end

    if curStep == 224 then
		doTweenAlpha('blackScreen1','blackScreen', 0, 1, 'linear');
        doTweenAlpha('Hudud','camHUD', 1, 1, 'quadIn');
        for i = 0, 3 do
            local noteX = getPropertyFromGroup('playerStrums', i, 'x')
            if not middlescroll then
                doTweenX('playerNote' .. i, 'playerStrums.members[' .. i .. ']', noteX - 700, stepCrochet / 1000 * 14, 'quartInOut')
            end
        end
	end

    if curStep == 462 then
		cameraFlash('camGame', '000000', 0.5, true)
	end

    if curStep == 487 then
        doTweenZoom('camz', 'camGame', 0.5, 0.3, 'quadInOut')
        cameraFlash('camGame', 'ff0000', 1, true)
        doTweenAlpha('bgreturn','base', 1, 0.4, 'quadIn');
	end

    if curStep == 992 then
        setProperty('videoCutscene.alpha', 0) 
	end

    if curStep == 994 then
        setProperty('videoCutscene.alpha', 0.1) 
	end
   
    if curStep == 1007 then
        setProperty('videoCutscene.alpha', 0.4) 
	end

    if curStep == 1018 then
        setProperty('videoCutscene.alpha', 0.7) 
	end

    if curStep == 1032 then
        setProperty('videoCutscene.alpha', 1) 
	end

    if curStep == 1000 then
        doTweenAlpha('bgout1','base', 0, 2, 'quadOut');
	end

    if curStep == 1312 then
        cameraFlash('camGame', 'FFFFFF', 1, true)
	end

    if curStep == 1553 then
        cameraFlash('camGame', 'FF0000', 0.2, true)
	end

    if curStep == 1555 then
        cameraFlash('camGame', 'FF0000', 0.2, true)
	end

    if curStep == 1556 then
        cameraFlash('camGame', 'FF0000', 0.1, true)
	end

    if curStep == 1558 then
        cameraFlash('camGame', 'FF0000', 0.2, true)
	end

    if curStep == 1560 then
        cameraFlash('camGame', 'FFFFF', 0.3, true)
	end

    if curStep == 1564 then
        cameraFlash('camGame', 'FF0000', 0.5, true)
        doTweenAlpha('bgin','base', 1, 1, 'quadOut');
	end

    if curStep == 1824 then
        doTweenAlpha('bgout','base', 0, 3, 'quadOut');
        setProperty('camGame.bgColor', getColorFromHex('ff0000'))
	end

    if curStep == 1946 then
		doTweenAlpha('blackScreen4','blackScreen', 1, 3, 'linear');
        doTweenAlpha('uiGroupTween', 'uiGroup', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween1', 'star', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween2', 'stardust', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween3', 'time', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween4', 'timeless', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween5', 'ratingTextSick', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween6', 'ratingTextNice', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween7', 'ratingTextShit', 0, 0.5, 'linear')
        doTweenAlpha('uiGroupTween8', 'scoreTxt17', 0, 0.5, 'linear')
        doTweenAlpha('ratingss', 'comboGroup', 0, 0.5, 'linear')
        for i = 0, 3 do
            local noteX = getPropertyFromGroup('playerStrums', i, 'x')
            if not middlescroll then
                doTweenX('playerNote' .. i, 'playerStrums.members[' .. i .. ']', noteX + 700, stepCrochet / 1000 * 14, 'quartInOut')
            end
        end
        doTweenAlpha(UIend, UIs, 0, 3, 'quadOut')
	end
end