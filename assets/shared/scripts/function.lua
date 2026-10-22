local canMouse = false

local SelectOne = true
local SelectTwo = false
local SelectThree = false

local canBack = false

function onCreate()
	initSaveData('DataFolder', 'Folder')
	flushSaveData('DataFolder')
	MoneyAmount = getDataFromSave('DataFolder', 'Money')

	if songName == 'Test' then
		function onStartCountdown() 
			if not allowCountdown then
				return Function_Stop
			end
		
			if allowCountdown then
				return Function_Continue
			end
		end

        runTimer('selectOne', 5, 1)

		return Function_Continue;
    end
end

function onUpdate()
	if songName == 'Test' then
              if keyJustPressed('pause') then
			exitMenu()
              end
			end

		if SelectTwo == true then
		if mouseReleased() == true and objectsOverlap('backL', 'arrow') then
			SelectTwo = false
			SelectOne = true
			setProperty('credit.visible', false)
			setProperty('crew.visible', false)
			setProperty('twoCrew.visible', false)
			setProperty('vexCrew.visible', false)
			setProperty('flaCrew.visible', false)
			setProperty('tCrew.visible', false)
			setProperty('uCrew.visible', false)
			setProperty('unCrew.visible', false)
			setProperty('backL.visible', false)
		elseif mouseReleased() == true and objectsOverlap('vexCrew', 'arrow') then
			SelectTwo = false
			SelectThree = true
			setProperty('01.visible', true)
			setProperty('backR.visible', true)
			setProperty('credit.visible', false)
			setProperty('crew.visible', false)
			setProperty('twoCrew.visible', false)
			setProperty('vexCrew.visible', false)
			setProperty('flaCrew.visible', false)
			setProperty('tCrew.visible', false)
			setProperty('uCrew.visible', false)
			setProperty('unCrew.visible', false)
			setProperty('backL.visible', false)
		elseif mouseReleased() == true and objectsOverlap('unCrew', 'arrow') then
			SelectTwo = false
			SelectThree = true
			setProperty('02.visible', true)
			setProperty('backR.visible', true)
			setProperty('credit.visible', false)
			setProperty('crew.visible', false)
			setProperty('twoCrew.visible', false)
			setProperty('vexCrew.visible', false)
			setProperty('flaCrew.visible', false)
			setProperty('tCrew.visible', false)
			setProperty('uCrew.visible', false)
			setProperty('unCrew.visible', false)
			setProperty('backL.visible', false)
		elseif mouseReleased() == true and objectsOverlap('flaCrew', 'arrow') then
			SelectTwo = false
			SelectThree = true
			setProperty('03.visible', true)
			setProperty('backR.visible', true)
			setProperty('credit.visible', false)
			setProperty('crew.visible', false)
			setProperty('twoCrew.visible', false)
			setProperty('vexCrew.visible', false)
			setProperty('flaCrew.visible', false)
			setProperty('tCrew.visible', false)
			setProperty('uCrew.visible', false)
			setProperty('unCrew.visible', false)
			setProperty('backL.visible', false)
		elseif mouseReleased() == true and objectsOverlap('tCrew', 'arrow') then
			SelectTwo = false
			SelectThree = true
			setProperty('04.visible', true)
			setProperty('backR.visible', true)
			setProperty('credit.visible', false)
			setProperty('crew.visible', false)
			setProperty('twoCrew.visible', false)
			setProperty('vexCrew.visible', false)
			setProperty('flaCrew.visible', false)
			setProperty('tCrew.visible', false)
			setProperty('uCrew.visible', false)
			setProperty('unCrew.visible', false)
			setProperty('backL.visible', false)
		elseif mouseReleased() == true and objectsOverlap('uCrew', 'arrow') then
			SelectTwo = false
			SelectThree = true
			setProperty('05.visible', true)
			setProperty('backR.visible', true)
			setProperty('credit.visible', false)
			setProperty('crew.visible', false)
			setProperty('twoCrew.visible', false)
			setProperty('vexCrew.visible', false)
			setProperty('flaCrew.visible', false)
			setProperty('tCrew.visible', false)
			setProperty('uCrew.visible', false)
			setProperty('unCrew.visible', false)
			setProperty('backL.visible', false)
			end
		end
		if canMouse == true and SelectTwo == true then
			setProperty('credit.visible', true)
			setProperty('crew.visible', true)
			setProperty('twoCrew.visible', true)
			setProperty('vexCrew.visible', true)
			setProperty('flaCrew.visible', true)
			setProperty('tCrew.visible', true)
			setProperty('uCrew.visible', true)
			setProperty('unCrew.visible', true)
			setProperty('backL.visible', true)
		end
		if SelectThree == true then
			if mouseReleased() == true and objectsOverlap('backR', 'arrow') then
				SelectTwo = true
				SelectThree = false
				setProperty('01.visible', false)
				setProperty('02.visible', false)
				setProperty('03.visible', false)
				setProperty('04.visible', false)
				setProperty('05.visible', false)
				setProperty('backR.visible', false)
				setProperty('credit.visible', true)
				setProperty('crew.visible', true)
				setProperty('twoCrew.visible', true)
				setProperty('vexCrew.visible', true)
				setProperty('flaCrew.visible', true)
				setProperty('tCrew.visible', true)
				setProperty('uCrew.visible', true)
				setProperty('unCrew.visible', true)
				setProperty('backL.visible', true)

				end
			end
		end

function onUpdatePost()
	if canMouse == true and SelectOne == true then
	if mouseReleased() == true and objectsOverlap('two', 'arrow') then
		canMouse = false
		setProperty('home.visible', false)
		setProperty('two.visible', false)
		setProperty('plush.visible', false)
		setProperty('mapped.visible', false)
		setProperty('piracy.visible', false)
		setProperty('self.visible', false)
		setProperty('warning.visible', false)
		setProperty('carpet.visible', false)
		setProperty('pic.visible', false)
		setProperty('credit.visible', false)
		setProperty('crew.visible', false)
		setProperty('twoCrew.visible', false)
		setProperty('vexCrew.visible', false)
		setProperty('chibi.visible', false)
		setProperty('credits.visible', false)
		doTweenX('loadSong', 'bar', 0, 0.7, 'CircInOut')
		runTimer('songOne', 0.9, 1)
		playSound('click')
	elseif mouseReleased() == true and objectsOverlap('plush', 'arrow') then
		canMouse = false
		setProperty('home.visible', false)
		setProperty('two.visible', false)
		setProperty('plush.visible', false)
		setProperty('mapped.visible', false)
		setProperty('piracy.visible', false)
		setProperty('self.visible', false)
		setProperty('warning.visible', false)
		setProperty('carpet.visible', false)
		setProperty('pic.visible', false)
		setProperty('credit.visible', false)
		setProperty('crew.visible', false)
		setProperty('twoCrew.visible', false)
		setProperty('vexCrew.visible', false)
		setProperty('chibi.visible', false)
		setProperty('credits.visible', false)
		doTweenX('loadSong', 'bar', 0, 0.7, 'CircInOut')
		runTimer('songTwo', 0.9, 1)
		playSound('click')
		elseif mouseReleased() == true and objectsOverlap('plush', 'arrow') then
		canMouse = false
		setProperty('home.visible', false)
		setProperty('two.visible', false)
		setProperty('plush.visible', false)
		setProperty('mapped.visible', false)
		setProperty('piracy.visible', false)
		setProperty('self.visible', false)
		setProperty('warning.visible', false)
		setProperty('carpet.visible', false)
		setProperty('pic.visible', false)
		setProperty('credit.visible', false)
		setProperty('crew.visible', false)
		setProperty('twoCrew.visible', false)
		setProperty('vexCrew.visible', false)
		setProperty('chibi.visible', false)
		setProperty('credits.visible', false)
		doTweenX('loadSong', 'bar', 0, 0.7, 'CircInOut')
		runTimer('songThree', 0.9, 1)
		playSound('click')
	elseif mouseReleased() == true and objectsOverlap('carpet', 'arrow') then
		SelectOne = false
        SelectTwo = true
	    end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if keyJustPressed('pause') and songName == 'Test' then
		exitMenu();
	end
end

function exitMenu()
	exitSong(true);
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'selectOne' then
	   canMouse = true
    end
	if tag == 'songOne' then
		loadSong('weeara');
	
	end
	if tag == 'songTwo' then
		loadSong('big');
	   end
	   if tag == 'songThree' then
		loadSong('15Seiz');
	   end
	end