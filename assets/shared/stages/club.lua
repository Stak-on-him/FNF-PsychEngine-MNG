local cheer = false
local crowdbounce = false
local crowdbouncesecond = false

local supersuperzoomshit = false
local superzoomshit = false

function onCreate()
	-- background shit
	setProperty('camGame.bgColor', getColorFromHex('FFFFFF'))
	setProperty('gfGroup.visible', false) 
	setProperty('showRating', false)    
	setProperty('showCombo', false)      
	setProperty('showComboNum', false)

	makeLuaSprite('musicRoom', 'club/musicRoom', 1510.0, -1140.0);
	setScrollFactor('musicRoom', 0.75, 0.875);
	
	makeLuaSprite('elevator', 'club/elevator', -2100.0, -1250.0);
	setScrollFactor('elevator', 0.7, 0.85);

	makeLuaSprite('bar', 'club/bar', -950.0, -980.0);
	setScrollFactor('bar', 0.85, 0.925);

	makeLuaSprite('clubUpper', 'club/clubUpper', -2500.0, -2550.0);
	setScrollFactor('clubUpper', 0.8, 0.9);

	makeLuaSprite('clubLower', 'club/clubLower', -2700.0, -2500.0);

	makeAnimatedLuaSprite("skid", "club/crowd/bgUpper/skid", 477.0, -1583.0)
	setScrollFactor('skid', 0.9, 0.95);
	addAnimationByPrefix("skid", "idle", "idle", 12, false)
	addAnimationByPrefix("skid", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("skid", "cheerRight", "cheerRight", 12, false)
	playAnim("skid", "idle", true)

	makeAnimatedLuaSprite("dj", "club/crowd/bgUpper/dj", 850.0, -1635.0)
	setScrollFactor('dj', 0.9, 0.95);
	addAnimationByPrefix("dj", "idle", "idle", 8, true)
	addAnimationByPrefix("dj", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("dj", "cheerRight", "cheerRight", 12, false)
	playAnim("dj", "idle", true)

	makeAnimatedLuaSprite("jerry", "club/crowd/bgUpper/jerry",-594.0, -1655.0)
	setScrollFactor('jerry', 0.9, 0.95);
	addAnimationByPrefix("jerry", "idle", "idle", 12, false)
	addAnimationByPrefix("jerry", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("jerry", "cheerRight", "cheerRight", 12, false)
	playAnim("jerry", "idle", true)

	makeAnimatedLuaSprite("crib", "club/crowd/bgUpper/crib", 160.0, -1750.0)
	setScrollFactor('crib', 0.9875, 1.0);
	addAnimationByPrefix("crib", "idle", "idle", 12, false)
	addAnimationByPrefix("crib", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("crib", "cheerRight", "cheerRight", 12, false)
	playAnim("crib", "idle", true)

	makeAnimatedLuaSprite("cribwhat", "club/crowd/bgUpper/crib", 160.0, -1750.0)
	setScrollFactor('cribwhat', 0.9875, 1.0);
	addAnimationByPrefix("cribwhat", "stare", "stare", 1, true)
	setProperty('cribwhat.visible', false)

	makeAnimatedLuaSprite("ink", "club/crowd/bgUpper/ink", -940.0, -1580.0)
	setScrollFactor('ink', 0.9, 0.95);
	addAnimationByPrefix("ink", "idle", "idle", 12, false)
	addAnimationByPrefix("ink", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("ink", "cheerRight", "cheerRight", 12, false)
	playAnim("ink", "idle", true)

	makeAnimatedLuaSprite("peacock", "club/crowd/bgUpper/peacock", -475.0, -1720.0)
	setScrollFactor('peacock', 0.9875, 1.0);
	addAnimationByPrefix("peacock", "idle", "idle", 12, false)
	addAnimationByPrefix("peacock", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("peacock", "cheerRight", "cheerRight", 12, false)
	addAnimationByPrefix("peacock", "whar", "whar", 1, true)
	addAnimationByPrefix("peacock", "fling", "fling", 12, false)
	addAnimationByPrefix("peacock", "hit_screen", "hit_screen", 1, false)
	playAnim("peacock", "idle", true)

	makeAnimatedLuaSprite("peacockfa", "club/crowd/bgUpper/peacock", -465.0, -1720.0)
	setScrollFactor('peacockfa', 0.9875, 1.0);
	addAnimationByPrefix("peacockfa", "whar", "whar", 1, true)
	--playAnim("peacockfa", "whar", true)
	setProperty('peacockfa.visible', false)

	makeAnimatedLuaSprite("peacockfling", "club/crowd/bgUpper/peacockanim", -943.0, -2430.0)
	setScrollFactor('peacockfling', 0.9875, 1.0);
	addAnimationByPrefix("peacockfling", "flinganim", "flinganim", 26, false)
	setProperty('peacockfling.visible', false)
	scaleObject("peacockfling", 0.9, 0.9)
	

	makeAnimatedLuaSprite("peacockf", "club/crowd/bgUpper/peacock", -475.0, -520.0)
	setScrollFactor('peacockf', 0, 0);
	addAnimationByPrefix("peacockf", "hit_screen", "hit_screen", 1, false)
	playAnim("peacockf", "hit_screen", true)
	setProperty('peacockf.visible', false)
	scaleObject("peacockf", 1.1, 1.1)

	makeAnimatedLuaSprite("gabe", "club/crowd/bgUpper/gabe", 1320.0, -2040.0)
	setScrollFactor('gabe', 0.9875, 1.0);
	addAnimationByPrefix("gabe", "idle", "idle", 12, false)
	addAnimationByPrefix("gabe", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("gabe", "cheerRight", "cheerRight", 12, false)
	playAnim("gabe", "idle", true)



	makeAnimatedLuaSprite("krinqle", "club/crowd/bgUpper/krinqle", 1650.0, -2240.0)
	setScrollFactor('krinqle', 0.9875, 1.0);
	addAnimationByPrefix("krinqle", "idle", "idle", 12, false)
	addAnimationByPrefix("krinqle", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("krinqle", "cheerRight", "cheerRight", 12, false)
	playAnim("krinqle", "idle", true)

	makeAnimatedLuaSprite("zibidi", "club/crowd/bgUpper/zibidi", -170.0, -1820.0)
	setScrollFactor('zibidi', 0.9875, 1.0);
	addAnimationByPrefix("zibidi", "idle", "idle", 12, false)
	addAnimationByPrefix("zibidi", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("zibidi", "cheerRight", "cheerRight", 12, false)
	playAnim("zibidi", "idle", true)

	makeAnimatedLuaSprite("zibidif", "club/crowd/bgUpper/zibidi", -318, -1912)
	setScrollFactor('zibidif', 0.9875, 1.0);
	addAnimationByPrefix("zibidif", "slap", "slap", 24, true)
	--playAnim("zibidif", "slap", true)
	setProperty('zibidif.visible', false)

	makeAnimatedLuaSprite("requiem", "club/crowd/bgUpper/requiem", -1539.0, -1905.0)
	setScrollFactor('requiem', 0.9875, 1.0);
	addAnimationByPrefix("requiem", "idle", "idle", 12, false)
	addAnimationByPrefix("requiem", "cheer", "cheer", 12, false)
	playAnim("requiem", "idle", true)

	makeAnimatedLuaSprite("requiemjump", "club/crowd/bgUpper/requiem", -1579.0, -2135.0)
	setScrollFactor('requiemjump', 0.9875, 1.0);
	addAnimationByPrefix("requiemjump", "drop_down", "drop_down", 12, false)

	setProperty('requiemjump.alpha', 0)

	makeAnimatedLuaSprite("alien", "club/crowd/bgUpper/alien", 1880.0, -2690.0)
	setScrollFactor('peacock', 0.9875, 1.0);
	addAnimationByPrefix("alien", "idle", "idle", 12, false)
	addAnimationByPrefix("alien", "cheer", "cheer", 12, false)
	playAnim("alien", "idle", true)

	makeAnimatedLuaSprite("binej", "club/crowd/bgUpper/binej",-2130.0, -2370.0)
	setScrollFactor('binej', 0.9875, 1.0);
	addAnimationByPrefix("binej", "idle", "idle", 12, false)
	addAnimationByPrefix("binej", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("binej", "cheerRight", "cheerRight", 12, false)
	playAnim("binej", "idle", true)

	makeAnimatedLuaSprite("headdzo", "club/crowd/bgUpper/headdzo",-2410.0, -2550.0)
	setScrollFactor('headdzo', 0.9875, 1.0);
	addAnimationByPrefix("headdzo", "idle", "idle", 12, false)
	addAnimationByPrefix("headdzo", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("headdzo", "cheerRight", "cheerRight", 12, false)
	playAnim("headdzo", "idle", true)

	makeLuaSprite('tableCenterRight', 'club/tableCenter', 430, -1500);
	setScrollFactor('tableCenterRight', 0.9, 0.95);

	makeLuaSprite('tableCenterLeft', 'club/tableCenter', -1030, -1500);
	setScrollFactor('tableCenterLeft', 0.9, 0.95);

	makeLuaSprite('tableSideRight', 'club/tableCenter', 1580, -2010);
	setScrollFactor('tableSideRight', 0.9, 0.95);

	makeLuaSprite('tableSideLeft', 'club/tableCenter', -2130, -1810);
	setScrollFactor('tableSideLeft', 0.9, 0.95);

	makeLuaSprite('tableCenter', 'club/clubLower', -2700.0, -2500.0);

	makeAnimatedLuaSprite("speakersRight", "club/speakersRight", 1000.0, -1350.0)
	setScrollFactor('speakersRight', 1.01, 1.01);
	addAnimationByPrefix("speakersRight", "idle", "idle", 12, false)
	scaleObject("speakersRight", 1.1, 1.1)
	playAnim("speakersRight", "idle", true)

	makeAnimatedLuaSprite("speakersLeft", "club/speakersLeft", -1600.0, -1340.0)
	setScrollFactor('speakersLeft', 1.01, 1.01);
	addAnimationByPrefix("speakersLeft", "idle", "idle", 12, false)
	scaleObject("speakersLeft", 1.1, 1.1)
	playAnim("speakersLeft", "idle", true)

	makeAnimatedLuaSprite("sinisterbart", "club/crowd/bgLower/sinisterbart", 250, -840)
	addAnimationByPrefix("sinisterbart", "idle", "idle", 6, true)
	addAnimationByPrefix("sinisterbart", "cheer", "cheer", 12, false)
	setScrollFactor("sinisterbart", 0.9625, 1.0)
	playAnim("sinisterbart", "idle", true)

	makeAnimatedLuaSprite("tvDude", "club/crowd/bgLower/tvDude", 420.0, -810.0)
	addAnimationByPrefix("tvDude", "idle", "idle", 24, true)
	addAnimationByPrefix("tvDude", "cheer", "cheer", 24, false)
	playAnim("tvDude", "idle", true)

	makeAnimatedLuaSprite("tvCat", "club/crowd/bgLower/tvCat", 20.0, -725.0)
	addAnimationByPrefix("tvCat", "idle", "idle", 8, true)
	addAnimationByPrefix("tvCat", "cheer", "cheer", 24, false)
	playAnim("tvCat", "idle", true)

	makeAnimatedLuaSprite("growl", "club/crowd/bgLower/growl", 680.0, -950.0)
	addAnimationByPrefix("growl", "idle", "idle", 8, false)
	addAnimationByPrefix("growl", "cheer", "cheer", 24, false)
	playAnim("growl", "idle", false)

	makeAnimatedLuaSprite("liliy", "club/crowd/bgLower/liliy", -350.0, -865.0)
	addAnimationByPrefix("liliy", "idle", "idle", 8, true)
	playAnim("liliy", "idle", true)

	makeAnimatedLuaSprite("dog", "club/crowd/bgLower/dog", 430.0, -430.0)
	addAnimationByPrefix("dog", "idle", "idle", 12, false)
	addAnimationByPrefix("dog", "cheer", "cheer", 12, false)
	playAnim("dog", "idle", true)

	makeAnimatedLuaSprite("bunny", "club/crowd/bgLower/bunny", -595.0, -760.0)
	addAnimationByPrefix("bunny", "idle", "idle", 12, false)
	addAnimationByPrefix("bunny", "cheer", "cheer", 12, false)
	playAnim("bunny", "idle", true)

	makeAnimatedLuaSprite("blueGhandi", "club/crowd/bgLower/blueGhandi", 100.0, -660.0)
	addAnimationByPrefix("blueGhandi", "idle", "idle", 12, false)
	addAnimationByPrefix("blueGhandi", "cheerLeft", "cheerLeft", 12, false)
	addAnimationByPrefix("blueGhandi", "cheerRight", "cheerRight", 12, false)
	scaleObject("blueGhandi", 1.1, 1.1)
	playAnim("blueGhandi", "idle", true)

	makeAnimatedLuaSprite("cannon", "club/crowd/bgLower/cannon", -1300.0, -1080.0)
	addAnimationByPrefix("cannon", "idle", "idle", 12, false)
	addAnimationByPrefix("cannon", "cheer", "cheer", 12, false)
	playAnim("cannon", "idle", true)

	makeAnimatedLuaSprite("spacey", "club/crowd/bgLower/spacey", -1480.0, -390.0)
	addAnimationByPrefix("spacey", "idle", "idle", 12, false)
	addAnimationByPrefix("spacey", "cheer", "cheer", 12, false)
	playAnim("spacey", "idle", true)


	makeAnimatedLuaSprite("krink", "club/crowd/bgLower/krink", 1100.0, -900.0)
	addAnimationByPrefix("krink", "idle", "idle", 24, true)
	playAnim("krink", "idle", true)

	makeAnimatedLuaSprite("guy", "objects/guy", 2100.0, -700.0)
	addAnimationByPrefix("guy", "1", "1", 24, true)
	setProperty('guy.flipX', true)
	setProperty('guy.alpha', 0)
	scaleObject("guy", 4.5, 4.5)
	playAnim("guy", "idle", true)


	makeAnimatedLuaSprite("fgCrowd", "club/crowd/fgCrowd",  -2880.0, 880.0) -- -780.0
	addAnimationByPrefix("fgCrowd", "idle", "idle", 4, false)
	addAnimationByPrefix("fgCrowd", "cheer1", "cheer1", 1, true)
	addAnimationByPrefix("fgCrowd", "cheer", "cheer", 1, true)
	playAnim("fgCrowd", "idle", true)
	scaleObject('fgCrowd', 1.1, 1.1)
	setScrollFactor('fgCrowd',1.55, 1.3);

	makeLuaSprite('blackScreen', '', -1000, -700)
    makeGraphic('blackScreen', 1980, 1080, '000000') 
    setProperty('blackScreen.alpha', 1)
    scaleObject('blackScreen', 2.1, 2.1)
    setScrollFactor('blackScreen', 0, 0);

    makeLuaSprite('FFFFFF','',-1500,-700)
    makeGraphic('FFFFFF',1980,1080,'FFFFFF')
    setScrollFactor('FFFFFF',0,0)
    scaleObject('FFFFFF', 3.1, 2.1)
    --setObjectCamera('FFFFFF','other')
    setProperty('FFFFFF.alpha',0.00001)


	addLuaSprite('musicRoom', false);
	addLuaSprite('elevator', false);
	addLuaSprite('bar', false);
	addLuaSprite('clubUpper', false);
	addLuaSprite('tableCenterRight', false);
	addLuaSprite('tableCenterLeft', false);
	addLuaSprite('tableSideRight', false);
	addLuaSprite('tableSideLeft', false);

	--upper crowd
	addLuaSprite('dj', false);
	addLuaSprite('skid', false);
	addLuaSprite('jerry', false);
	addLuaSprite('ink', false);
	addLuaSprite('crib', false);
	addLuaSprite('cribwhat', false);
	addLuaSprite('zibidif', false);
	addLuaSprite('peacock', false);
	addLuaSprite('peacockfa', false);

	addLuaSprite('gabe', false);
	addLuaSprite('dj', false);
	addLuaSprite('krinqle', false);
	addLuaSprite('zibidi', false);
	
	addLuaSprite('requiem', false);
	addLuaSprite('alien', false);
	addLuaSprite('binej', false);
	addLuaSprite('headdzo', false);
	addLuaSprite('requiemjump', false);
	addLuaSprite('clubLower', false);
	addLuaSprite('speakersRight', false);
	addLuaSprite('speakersLeft', false);

	--lower crowd
	addLuaSprite("sinisterbart", false)		
	addLuaSprite("liliy", false)
	addLuaSprite("tvDude", false)
	addLuaSprite("tvCat", false)
	addLuaSprite("bunny", false)
	addLuaSprite("growl", false)
	addLuaSprite("dog", false)
	addLuaSprite("blueGhandi", false)
	addLuaSprite("cannon", false)
	addLuaSprite("krink", false)
	addLuaSprite("spacey", false)
	addLuaSprite("guy", false)

	addLuaSprite("fgCrowd", true)
	addLuaSprite("peacockf", true)
	addLuaSprite('white',false)
	addLuaSprite('FFFFFF',false)
	addLuaSprite('blackScreen', true)

	addLuaSprite('peacockfling', true);


	setProperty('camHUD.alpha', 0)
--setProperty('cpuControlled', true)
	
end
function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('speakersLeft', 'idle', false);
		objectPlayAnimation('speakersRight', 'idle', false);
		setProperty('cutsceneOverlayevent.alpha', 0.2)
		doTweenAlpha('wow', 'cutsceneOverlayevent', 0, crochet / 1000 * 1.5, 'expoOut')
	end
	if supersuperzoomshit == true then 
		if curBeat % 1 == 0 then 
			triggerEvent('Add Camera Zoom', '0.01', '0.02');
		end
	end
	if superzoomshit == true then 
		if curBeat % 2 == 0 then 
			triggerEvent('Add Camera Zoom', '0.06', '0.08');
		end
	end
	if crowdbounce == true then
		if curBeat % 2 == 0 then
			local baseY = getProperty('fgCrowd.y')
        	setProperty('fgCrowd.y', baseY + 50)
        	doTweenY('fgCrowdBounce', 'fgCrowd', baseY, 0.5, 'quartOut')
        end
    end
    if crowdbouncesecond == true then
    	if curBeat % 1 == 0 then
			local baseY = getProperty('fgCrowd.y')
        	setProperty('fgCrowd.y', baseY + 50)
        	doTweenY('fgCrowdBounce', 'fgCrowd', baseY, 0.5, 'quartOut')
        end
    end
		if curBeat % 2 == 0 then
			objectPlayAnimation('skid', 'idle', false);
			objectPlayAnimation('jerry', 'idle', false);
			objectPlayAnimation('ink', 'idle', false);
			objectPlayAnimation('crib', 'idle', false);
			objectPlayAnimation('peacock', 'idle', false);
			objectPlayAnimation('gabe', 'idle', false);
			objectPlayAnimation('krinqle', 'idle', false);
			objectPlayAnimation('zibidi', 'idle', false);
			objectPlayAnimation('requiem', 'idle', false);
			objectPlayAnimation('alien', 'idle', false);
			objectPlayAnimation('binej', 'idle', false);
			objectPlayAnimation('headdzo', 'idle', false);
			objectPlayAnimation('sinisterbart', 'idle', false);
			objectPlayAnimation('tvDude', 'idle', false);
			objectPlayAnimation('tvCat', 'idle', false);
			objectPlayAnimation('bunny', 'idle', false);
			objectPlayAnimation('growl', 'idle', false);
			objectPlayAnimation('dog', 'idle', false);
			objectPlayAnimation('blueGhandi', 'idle', false);
			objectPlayAnimation('cannon', 'idle', false);
			objectPlayAnimation('spacey', 'idle', false);
			objectPlayAnimation('fgCrowd', 'idle', false);
		end

		if cheer == true then
			objectPlayAnimation('tvCat', 'cheer', true);
			if curBeat % 2 == 0 then
				objectPlayAnimation('alien', 'cheer', false);
				objectPlayAnimation('sinisterbart', 'cheer', false);
				objectPlayAnimation('tvDude', 'cheer', false);
				objectPlayAnimation('bunny', 'cheer', false);
				objectPlayAnimation('growl', 'cheer', false);
				objectPlayAnimation('dog', 'cheer', false);
				objectPlayAnimation('cannon', 'cheer', false);
				objectPlayAnimation('spacey', 'cheer', false);
			end
			if curBeat % 2 == 0 then
				objectPlayAnimation('skid', 'cheerLeft', false);
				objectPlayAnimation('jerry', 'cheerLeft', false);
				objectPlayAnimation('ink', 'cheerLeft', false);
				objectPlayAnimation('crib', 'cheerLeft', false);
				objectPlayAnimation('peacock', 'cheerLeft', false);
				objectPlayAnimation('gabe', 'cheerLeft', false);
				objectPlayAnimation('krinqle', 'cheerLeft', false);
				objectPlayAnimation('zibidi', 'cheerLeft', false);
				objectPlayAnimation('headdzo', 'cheerLeft', false);
				objectPlayAnimation('blueGhandi', 'cheerLeft', false);
				objectPlayAnimation("fgCrowd", "cheer", true)
			else
				objectPlayAnimation('skid', 'cheerRight', false);
				objectPlayAnimation('jerry', 'cheerRight', false);
				objectPlayAnimation('ink', 'cheerRight', false);
				objectPlayAnimation('crib', 'cheerRight', false);
				objectPlayAnimation('peacock', 'cheerRight', false);
				objectPlayAnimation('gabe', 'cheerRight', false);
				objectPlayAnimation('krinqle', 'cheerRight', false);
				objectPlayAnimation('zibidi', 'cheerRight', false);
				objectPlayAnimation('headdzo', 'cheerRight', false);
				objectPlayAnimation('blueGhandi', 'cheerRight', false);
				objectPlayAnimation("fgCrowd", "cheer1", true)
			end
		end
end 

function onSongStart()
	doTweenAlpha('blackScreenttwin','blackScreen', 0 ,6,'linear');
end
function onStepHit()
	if curStep == 20 then
		doTweenAlpha('camHUDf','camHUD', 1 ,4,'linear');
	end
	if curStep == 64 then
		setProperty('isCameraOnForcedPos', false)
		cancelTween('camDownTween')
		cancelTween('camDownTweenZoomы')
		removeLuaScipt('testvideo')
		setProperty('testvideo.visible', false)
	end
 	if curStep == 304 then
		setProperty('defaultCamZoom', 0.44)
 	end
 	if curStep == 320 then
		setProperty('defaultCamZoom', 0.38)
		supersuperzoomshit = true
		setProperty('cameraSpeed', 2.5)
 	end
 	if curStep == 448 then
		setProperty('defaultCamZoom', 0.4)
		supersuperzoomshit = false
		setProperty('cameraSpeed', 1)
 	end
 	if curStep == 440 then
		doTweenY('crowdY', 'fgCrowd', -780.0, 3.2, 'quintOut')
		--setProperty('fgCrowd.y', -780.0)
 	end
 	if curStep == 463 then
 		cancelTween('crowdY')
		crowdbounce = true
 	end
 	if curStep == 704 then
		setProperty('defaultCamZoom', 0.42)
 	end
 	if curStep == 896 then
		setProperty('defaultCamZoom', 0.48)
		doTweenZoom('zoomTween', 'camGame', 0.48, 4, 'cubeInOut')
 	end
 	if curStep == 900 then
		setProperty('defaultCamZoom', 0.48)
		doTweenZoom('zoomTween', 'camGame', 0.48, 4, 'quadInOut')
 	end
 	if curStep == 960 then
		setProperty('defaultCamZoom', 0.4)
 	end
 	if curStep == 1028 then
		setProperty('defaultCamZoom', 0.48)
		doTweenZoom('zoomTween', 'camGame', 0.48, 4, 'quadInOut')
 	end
 	if curStep == 1088 then
		setProperty('defaultCamZoom', 0.43)
 	end
 	if curStep == 1175 then
 		setProperty('isCameraOnForcedPos', true)
		doTweenX('camDownTweenx', 'camFollow', -1000, 2.1, 'quadInOut')
		doTweenY('camDownTweeny', 'camFollow', -1600, 2.1, 'quadInOut')
    end
 	if curStep == 1201 then
		playAnim("requiemjump", "drop_down", false)
		setProperty("requiemjump.alpha", 1)
		setProperty("requiem.alpha", 0)
 	end
 	if curStep == 1204 then
 		cancelTween('camDownTweenx')
 		cancelTween('camDownTweeny')
		doTweenX('camDownTweenxx', 'camFollow', -400, 1.3, 'quadInOut')
		doTweenY('camDownTweenyy', 'camFollow', -300, 1.3, 'quadInOut')
 	end
 	if curStep == 1209 then
 		setProperty("requiemjump.alpha", 0)
		setProperty('gfGroup.visible', true)
		triggerEvent('Play Animation', 'drop', 'gf')
	end
	if curStep == 1212 then
		
	end
 	if curStep == 1278 then
		setProperty('defaultCamZoom', 0.4)
		doTweenZoom('zoomTween', 'camGame', 0.4, 4, 'cubeInOut')

 	end
 	if curStep == 1280 then
		setProperty('isCameraOnForcedPos', false)
		
 	end
 	if curStep == 1328 then
        doTweenZoom('zoomTween', 'camGame', 0.8, 1.4, 'cubeInOut')
        setProperty('defaultCamZoom', 0.8)


        for i = 0, 3 do
            local noteX = getPropertyFromGroup('playerStrums', i, 'x')
            if not middlescroll then
                doTweenX('playerNote' .. i, 'playerStrums.members[' .. i .. ']', noteX - 315, stepCrochet / 1000 * 14, 'quartInOut')
            end
        end
    end
    if curStep == 1332 then
    setProperty('blackBG.alpha', 1)
    setProperty('blackBG.y', -1320)
    doTweenY('blackBGEnter', 'blackBG', 0, crochet / 1000, 'cubeOut')
    end
    if curStep == 1338 then
        setProperty('mimiColorized.alpha', 1) 
        setProperty('mimiColorizedBG.alpha', 0.875)
        local targetXMimi = getProperty('mimiColorized.x') + 25
        doTweenX('mimiEnter', 'mimiColorized', targetXMimi, stepCrochet / 1000 * 2.5, 'expoOut')
    end
    if curStep == 1340 then
        setProperty('kevinColorized.alpha', 1) 
        setProperty('kevinColorizedBG.alpha', 0.875)
        setProperty('cutsceneBarBottom.alpha', 1)
        setProperty('cutsceneBarTop.alpha', 1)
    end
    if curStep == 1342 then
        setProperty('requiemColorizedBG.alpha', 0.875)
        setProperty('requiemColorized.alpha', 1)
         local targetXRequiem = getProperty('requiemColorized.x') - 25 
        doTweenX('requiemEnter', 'requiemColorized', targetXRequiem, stepCrochet / 1000 * 2.5, 'expoOut')
    end
    if curStep == 1344 then
        setProperty('cutsceneOverlayevent.visible', true)
    end
    if curStep == 1592 then
        if not downscroll then

        	doTweenY('hb', 'healthBar', 780, crochet / 1000 * 2, 'sineInOut')
		doTweenY('hbBG', 'healthBarBG', 780, crochet / 1000 * 2, 'sineInOut')
		doTweenY('ic1', 'iconP1', 768, crochet / 1000 * 2, 'sineInOut')
		doTweenY('score', 'scoreTxt17', 780, crochet / 1000 * 2, 'sineInOut')
		doTweenY('ic2', 'iconP2', 768, crochet / 1000 * 2, 'sineInOut')
		doTweenAlpha('ratingss', 'comboGroup', 0, 0.2, 'linear')
        else
        	doTweenY('hb', 'healthBar', -100, crochet / 1000 * 2, 'sineInOut')
			doTweenY('hbBG', 'healthBarBG', -100, crochet / 1000 * 2, 'sineInOut')
			doTweenY('ic1', 'iconP1', -200, crochet / 1000 * 2, 'sineInOut')
			doTweenY('score', 'scoreTxt17', -100, crochet / 1000 * 2, 'sineInOut')
			doTweenY('ic2', 'iconP2', -200, crochet / 1000 * 2, 'sineInOut')
			doTweenAlpha('ratingss', 'comboGroup', 0, 0.2, 'linear')
        end
        doTweenY('barTopTween', 'cutsceneBarTop', -310, crochet / 1000 * 2, 'sineOut')
       	doTweenY('barBottomTween', 'cutsceneBarBottom', 720, crochet / 1000 * 2, 'sineOut')
        doTweenAlpha('overlayBottomAlphaTween', 'cutsceneOverlayBottom', 1, crochet / 1000 * 1.9, 'expoIn')
        for i = 0, 3 do
            doTweenAlpha('playerNoteTween'..i, 'playerStrums.members['..i..']', 0, crochet / 1000 * 2, 'quartIn')
        end
    end
    if curStep == 1599 then
    	if not luaSpriteExists('videoSprite') then
				addLuaScript('kevinvideo1')
		end
	end
    if curStep == 1600 then --1600
    	
    	setProperty('cutsceneOverlayevent.visible', false)
		setProperty('isCameraOnForcedPos', false)
        setProperty('requiemColorized.alpha', 0)
        setProperty('kevinColorized.alpha', 0)
        setProperty('mimiColorized.alpha', 0)
        setProperty('kevinColorizedBG.alpha', 0)
        setProperty('mimiColorizedBG.alpha', 0)
        setProperty('requiemColorizedBG.alpha', 0)
        setProperty('colorizedEventGroup.visible', false)
        setProperty('cutsceneOverlayBottom.alpha', 1)
        cancelTween('overlayBottomAlphaTween') 
        doTweenAlpha('overlayBottomFade', 'cutsceneOverlayBottom', 0, crochet / 1000 * 3, 'quartOut')

        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 0.0001)
        end
    end
    if curStep == 1624 then
        doTweenAlpha('overlayBottomTween', 'cutsceneOverlayBottom', 1.0, crochet / 1000 * 2, 'quartIn')
    end

    if curStep == 1632 then
        doTweenAlpha('overlayBottomTween', 'cutsceneOverlayBottom', 0.0001, crochet / 1000 * 3, 'quartOut')
    end
     if curStep == 1714 then
        for i = 0, 3 do 
            local note = getPropertyFromGroup('playerStrums', i, 'x')
            note = note + 315 + 500
        	if not middlescroll then
	            setPropertyFromGroup('playerStrums', i, 'x', note) 
	            doTweenX('playerNoteTween'..i, 'playerStrums.members['..i..']', note - 500, crochet / 1000 * 5, 'quintOut')
	        else
	        	setPropertyFromGroup('playerStrums', i, 'x', note) 
	            doTweenX('playerNoteTween'..i, 'playerStrums.members['..i..']', note - 1000, crochet / 1000 * 5, 'quintOut')
        	end
            setPropertyFromGroup('playerStrums', i, 'alpha', 1)
        end
    end
    if curStep == 1720 then
        doTweenAlpha('overlayBottomTween', 'cutsceneOverlayTop', 1.0, crochet / 1000 * 1.9, 'quartIn')
    end
    if curStep == 1728 then
        setProperty('defaultCamZoom', 0.65)
        doTweenZoom('zoomSmooth', 'camGame', 0.65, 0.004, 'cubeInOut')
        cancelTween('overlayTopTween') 
        setProperty('cutsceneOverlayTop.alpha', 1.0)
    	setProperty('cutsceneBarTop.alpha', 0)
    	setProperty('cutsceneBarBottom.alpha', 0)
        doTweenAlpha('overlayTopFade', 'cutsceneOverlayTop', 0, crochet / 1000 * 3, 'quartOut')
        setProperty('blackBG.alpha', 0)
        setProperty('placeholder.alpha', 0)
        setProperty('cutsceneBarTop.y', -66)
        setProperty('cutsceneBarBottom.y', 720)
        removeLuaSprite('videoSprite2', true)
        setProperty('videoSprite.visible', false)
      	if not downscroll then
        	doTweenY('hb', 'healthBar', 650, crochet / 1000 * 4, 'cubeOut')
			doTweenY('hbBG', 'healthBarBG', 650, crochet / 1000 * 4, 'cubeOut')
			doTweenY('ic1', 'iconP1', 570, crochet / 1000 * 4, 'cubeOut')
			doTweenY('score', 'scoreTxt17', 680, crochet / 1000 * 4, 'cubeOut')
			doTweenY('ic2', 'iconP2', 570, crochet / 1000 * 4, 'cubeOut')
			doTweenAlpha('ratingss', 'comboGroup', 1, 0.2, 'linear')
		else
			doTweenY('hb', 'healthBar', 50, crochet / 1000 * 4, 'cubeOut')
			doTweenY('hbBG', 'healthBarBG', 50, crochet / 1000 * 4, 'cubeOut')
			doTweenY('ic1', 'iconP1', 10, crochet / 1000 * 4, 'cubeOut')
			doTweenY('score', 'scoreTxt17', 90, crochet / 1000 * 4, 'cubeOut')
			doTweenY('ic2', 'iconP2', 10, crochet / 1000 * 4, 'cubeOut')
			doTweenAlpha('ratingss', 'comboGroup', 1, 0.2, 'linear')
		end
    end
    if curStep == 1729 then
        doTweenZoom('zoomSmooth', 'camGame', 0.45, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.45)
    end
    if curStep == 1790 then
        doTweenZoom('zoomSmooth', 'camGame', 0.6, 1.2, 'cubeIn')
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1792 then
        doTweenAlpha('blackFadeTo1', 'blackBG1', 1, (60 / 150), 'expoIn')
    end
    --left side
    if curStep == 1798 then
    	setProperty('camFollow.x', -1500)
	    setProperty('camFollow.y', -2000)
	end
    if curStep == 1799 then
    	cheer = true
    	setProperty('defaultCamZoom', 0.65)
	    doTweenZoom('zoomSmooth', 'camGame', 0.65, 0.0004, 'linear')
	    
    end
	if curStep == 1800 then
		setProperty('cameraSpeed', 1900)
    	--setProperty('followChars', false)
    	setProperty('isCameraOnForcedPos', true)

    	cancelTween('zoomSmooth')
	    cancelTween('camDownTween')

	    
	    
	    setProperty('blackBG1.alpha', 0)
	    doTweenAlpha('blackFadeTo1', 'blackBG1', 1, (60 / 150), 'expoIn')
	end
    if curStep == 1804 then
        setProperty('blackBG1.alpha', 1)
        setProperty('defaultCamZoom', 0.7)
        doTweenZoom('zoomSmooth', 'camGame', 0.7, 0.0004, 'linear')
    end
    --right side
    if curStep == 1807 then
    	setProperty('camFollow.x', 1350)
    	setProperty('camFollow.y', -1800)
    end
    if curStep == 1808 then
        setProperty('blackBG1.alpha', 0)
        doTweenAlpha('blackFadeTo1_2', 'blackBG1', 1, (60 / 150), 'expoIn') 
    end
    if curStep == 1812 then
        setProperty('blackBG1.alpha', 1)
        doTweenZoom('zoomSmooth', 'camGame', 0.75, 0.0004, 'linear')
        setProperty('defaultCamZoom', 0.75)
    end
    --center
    if curStep == 1815 then
    	setProperty('camFollow.x', 0)
        setProperty('camFollow.y', -1550)
       end
    if curStep == 1816 then
        setProperty('blackBG1.alpha', 0.0001)
        doTweenAlpha('blackFadeTo1_3', 'blackBG1', 1, (60 / 150), 'expoIn')
        
        
    end
    if curStep == 1820 then
        setProperty('blackBG1.alpha', 1)
        cheer = false
        setProperty('camFollow.x', 500)
        setProperty('camFollow.y', -275)
    end
    if curStep == 1824 then
    	
        doTweenAlpha('blackFadeOut', 'blackBG1', 0.0001, (60 / 150) * 2, 'quartOut')
        --triggerEvent('Camera Follow Pos', 500, -275)
        
        doTweenZoom('zoomSmooth1', 'camGame', 0.65, 1, 'quartOut')
        setProperty('defaultCamZoom', 0.65)
        doTweenX('camMoveX', 'camFollowPos', 650, 3.5, 'sineInOut')
    	doTweenY('camMoveY', 'camFollowPos', -150, 3.5, 'sineInOut')
    end
    if curStep == 1825 then
    	setProperty('cameraSpeed', 1)
    	setProperty('isCameraOnForcedPos', true)
    end
    if curStep == 1831 then
        cancelTween('zoomSmooth1')
        doTweenZoom('zoomSmooth', 'camGame', 1.05, 4, 'cubeInOut')
        setProperty('defaultCamZoom', 1.05)
        
    end
    if curStep == 1840 then
        setProperty('guy.alpha', 1)
        doTweenX('guyguy', 'guy', -2000, 0.666, 'linear')
        
        
    end
    if curStep == 1855 then
        
        cheer = true
        crowdbounce = false
        crowdbouncesecond = true
        setProperty('guy.alpha', 0)
        cancelTween('zoomSmooth')
    end
    if curStep == 1856 then
    	setProperty('isCameraOnForcedPos', false)
        setProperty("tvCat.y", -790)
        setProperty("tvDude.y", -770)
        setProperty("dog.y", -420)
        setProperty("growl.y", -930)
        setProperty("bunny.y", -790)  
        setProperty("bunny.x", -640) 
        setProperty("blueGhandi.y", -680.0)
        setProperty("cannon.y", -1200.0) 
        setProperty("cannon.x", -1400.0)
        doTweenZoom('zoomSmooth2', 'camGame', 0.35, 4, 'expoOut')
        setProperty('defaultCamZoom', 0.35)
        
        cancelTween('zoomSmooth')
        cancelTween('zoomSmooth1')
        --setProperty('camFollow.x', -400)
		--setProperty('camFollow.y', -300)
        
    end
     if curStep == 1870 then
        setProperty('isCameraOnForcedPos', true)
        
        
    end
    if curStep == 1920 then
        setProperty('isCameraOnForcedPos', false)
        
        
    end
     if curStep == 2047 then
    	setProperty('isCameraOnForcedPos', true)
    	doTweenZoom('zoomSmooth', 'camGame', 0.58, 3, 'cubeInOut')
    	doTweenY('camDownTweena', 'camFollow', -1600, 3.5, 'quadInOut')
    	doTweenX('camDownTweenaa', 'camFollow', -10, 3.5, 'quadInOut')
    	setProperty('defaultCamZoom', 0.58)
	end
	if curStep == 2070 then
		cancelTween('zoomSmooth')
		doTweenZoom('zoomSmooth1', 'camGame', 0.42, 3, 'cubeInOut')
		setProperty('defaultCamZoom', 0.42)
	end
	if curStep == 2100 then
        setProperty("zibidi.visible", false)
        setProperty("zibidif.visible", true)
       playAnim("zibidif", "slap", true)

    end
    
    if curStep == 2103 then

        setProperty("peacock.visible", false)
        setProperty("peacockfa.visible", true)
    end
    if curStep == 2107 then

        setProperty("peacockfa.visible", false)
        setProperty('peacockfling.visible', true)
        playAnim("peacockfling", "flinganim", false)
        
        
    end
    if curStep == 2112 then
        setProperty('peacockfling.visible', false)
        setProperty("peacockf.visible", true)
        camon = true
        setProperty('cribwhat.visible', true)
        setProperty('crib.visible', false)
        triggerEvent('Screen Shake', '0.25, 0.025', '0.43')
         supersuperzoomshit = true
    end
    if curStep == 2112 then
        setProperty("zibidi.visible", true)
        setProperty("zibidif.visible", false)
    end
    if curStep == 2118 then
     doTweenY('c', 'peacockf', 1900, 6, 'quadIn')
     doTweenAngle('ca', 'peacockf', -40, 4.2, 'quadIn')
	end
	if curStep == 2134 then
     cancelTween('c')
     cancelTween('ca')
     doTweenY('caa', 'peacockf', 3900, 0.9, 'quadIn')
     doTweenAngle('caaa', 'peacockf', -40, 0.75, 'quadIn')
	end
	if curStep == 2144 then

     doTweenY('camDownTween', 'camFollow', -300, 3.5, 'quadInOut')
     doTweenZoom('camDownTweenZoom', 'camGame', 0.38, 3.5, 'quadInOut')
     setProperty('defaultCamZoom', 0.38)
	end
	if curStep == 2176 then
		setProperty('cameraSpeed', 1)
		cancelTween('camDownTweenZoom')
		setProperty('defaultCamZoom', 0.38)
	end
	if curStep == 2192 then
		setProperty('defaultCamZoom', 0.41)
	end
	if curStep == 2208 then
		setProperty('defaultCamZoom', 0.44)
	end
	if curStep == 2228 then
		doTweenX('camDownTweenaaa', 'camFollow', 500, 1, 'cubeIn')
		setProperty('defaultCamZoom', 0.36)
	end
	if curStep == 2234 then
		--setProperty('cameraSpeed', 0.5)
		--cancelTween('camDownTween')
		
		--setProperty('camFollow.x', 400)
		doTweenZoom('zoomTween', 'camGame', 0.7, 1, 'cubeIn')
        setProperty('defaultCamZoom', 0.7)
     	doTweenAlpha('overlayBottomTween', 'cutsceneOverlayTop', 1.0, crochet / 1000 * 1.3, 'quartIn')
	end
	if curStep == 2239 then
	setProperty('camZooming', false)
	addLuaScript('kevinvideo2')
	supersuperzoomshit = false
	cancelTween('zoomTween')
	setProperty('cutsceneOverlayTop.alpha', 1)
	doTweenAlpha('overlayTopFade', 'cutsceneOverlayTop', 0, crochet / 1000 * 4, 'quartOut')
     --setProperty('camGame.alpha', 0)
     setProperty('camHUD.alpha', 0)
	end
end
	if curStep == 2240 then
	
end
