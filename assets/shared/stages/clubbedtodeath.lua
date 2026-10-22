local angleshit = 1;
local anglevar = 1;
local angle = false 
local angledis = false 

function onCreate()
	-- background shit
	setProperty('camGame.bgColor', getColorFromHex('000000'))

	makeLuaSprite('bar', 'club/bar', -950.0, -980.0);
	setScrollFactor('bar', 0.85, 0.925);

	makeLuaSprite('clubUpper', 'club/clubUpper', -2500.0, -2550.0);
	setScrollFactor('clubUpper', 0.8, 0.9);

	makeLuaSprite('clubLower', 'club/clubLower', -2700.0, -2500.0);


	makeLuaSprite('tableCenterRight', 'club/tableCenter', 430, -1500);
	setScrollFactor('tableCenterRight', 0.9, 0.95);

	makeLuaSprite('tableCenterLeft', 'club/tableCenter', -1030, -1500);
	setScrollFactor('tableCenterLeft', 0.9, 0.95);

	makeLuaSprite('tableSideRight', 'club/tableCenter', 1580, -2010);
	setScrollFactor('tableSideRight', 0.9, 0.95);

	makeLuaSprite('tableSideLeft', 'club/tableCenter', -2130, -2010);
	setScrollFactor('tableSideLeft', 0.9, 0.95);

	makeLuaSprite('tableCenter', 'club/clubLower', -2700.0, -2500.0);

	makeAnimatedLuaSprite("speakersRight", "club/speakersRight", 1000.0, -1350.0)
	setScrollFactor('speakersRight', 1.01, 1.01);
	addAnimationByPrefix("speakersRight", "idle", "idle", 12, false)
	scaleObject("speakersRight", 1.1, 1.1)
	objectPlayAnimation("speakersRight", "idle", true)

	makeAnimatedLuaSprite("speakersLeft", "club/speakersLeft", -1600.0, -1340.0)
	setScrollFactor('speakersLeft', 1.01, 1.01);
	addAnimationByPrefix("speakersLeft", "idle", "idle", 12, false)
	scaleObject("speakersLeft", 1.1, 1.1)
	objectPlayAnimation("speakersLeft", "idle", true)


	makeLuaSprite('blackbg', '', 0, 0)
    makeGraphic('blackbg', screenWidth, screenHeight, '000000')
	setObjectOrder('blackbg', 5)
    setProperty('blackbg.alpha', 0)
	setProperty('camGame.bgColor', getColorFromHex('000000'))

	
	makeLuaSprite('blackScreen', '', 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    setProperty('blackScreen.alpha', 1)

	addLuaSprite('blackbg', false);
	addLuaSprite('bar', false);
	addLuaSprite('clubUpper', false);
	addLuaSprite('tableCenterRight', false);
	addLuaSprite('tableCenterLeft', false);
	addLuaSprite('tableSideRight', false);
	addLuaSprite('tableSideLeft', false);
	addLuaSprite('clubLower', false);
	addLuaSprite('speakersRight', false);
	addLuaSprite('speakersLeft', false);	
	addLuaSprite("fgCrowd", true)
	addLuaSprite('blackScreen', true)

    setProperty('camHUD.alpha', 0)
end

function onSongStart()
	doTweenAlpha('blackScreenttwin','blackScreen', 0 ,6,'linear')
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation("speakersRight", "idle", true)
		objectPlayAnimation("speakersLeft", "idle", true)
	end


	-- Анимация bounce для fgCrowd
	local beatStep = 1
	if curBeat % beatStep == 0 then
		local baseY = getProperty('fgCrowd.y')
		setProperty('fgCrowd.y', baseY + 50)
		doTweenY('fgCrowdBounce', 'fgCrowd', baseY, 0.5, 'quartOut')
	end

	-- Эффекты камеры для angle режима
	if angle then
		if curBeat < 388 then
			triggerEvent('Add Camera Zoom', 0.02, 0.03)

			if curBeat % 2 == 0 then
				angleshit = anglevar
			else
				angleshit = -anglevar
			end

			setProperty('camHUD.y', angleshit*2)
			setProperty('camGame.y', angleshit*2)

			doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.012, 'circOut')
			doTweenX('tuin', 'camHUD', -angleshit*3, crochet*0.01, 'linear')
			doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.012, 'circOut')
			doTweenX('ttrn', 'camGame', -angleshit*3, crochet*0.01, 'linear')
		else
			setProperty('camHUD.y', 0)
			setProperty('camHUD.x', 0)
		end
	end

	-- Сброс эффектов камеры для angledis режима
	if angledis then
		setProperty('camHUD.y', 0)
		setProperty('camGame.y', 0)
		setProperty('camHUD.angle', 0)
		setProperty('camGame.angle', 0)

		doTweenAngle('turn', 'camHUD', 0, 0.0001, 'circOut')
		doTweenX('tuin', 'camHUD', 0, 0.0001, 'linear')
		doTweenAngle('tt', 'camGame', 0, 0.0001, 'circOut')
		doTweenX('ttrn', 'camGame', 0, 0.0001, 'linear')
	end
end

function onStepHit()
	-- Эффекты камеры для angle режима на каждом шаге
	if angle then
		if curBeat < 388 then
			if curStep % 4 == 0 then
				doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
				doTweenY('rrr2', 'camGame', -12, stepCrochet*0.002, 'circOut')
			end
			if curStep % 4 == 2 then
				doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
				doTweenY('rir2', 'camGame', 0, stepCrochet*0.002, 'sineIn')
			end
		end
	end

	-- Основные события на определенных шагах
	if curStep == 10 then
		doTweenAlpha('camHUDf','camHUD', 1 ,4,'linear')
	end
	if curStep == 20 then
		setProperty('isCameraOnForcedPos', false)
	end
	
	if curBeat % 2 == 0 then
         doTweenAlpha('redPulse', 'redFilter', 0.5, 0.1, 'sineInOut')
    else
         doTweenAlpha('redPulse', 'redFilter', 0.2, 0.1, 'sineInOut')
    end 
end