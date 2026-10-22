function onCreate()
	-- background shit
	makeLuaSprite('black', 'laptop/screen/black', 0, 0);
	setLuaSpriteScrollFactor('black', 1, 1);
	scaleLuaSprite('black', 1, 1)

	makeLuaSprite('bar', 'laptop/loadBar', -600, 0);
	setLuaSpriteScrollFactor('bar', 1, 1);
	scaleLuaSprite('bar', 1, 1)

	makeLuaSprite('song', 'laptop/screen/song', 0, 0);
	setLuaSpriteScrollFactor('song', 1, 1);
	scaleLuaSprite('song', 1, 1)

	makeLuaSprite('home', 'laptop/screen/home', 0, 0);
	setLuaSpriteScrollFactor('home', 1, 1);
	scaleLuaSprite('home', 1, 1)

	makeLuaSprite('two', 'laptop/song-icon/bf', 540, 320);
	setLuaSpriteScrollFactor('two', 1, 1);
	scaleLuaSprite('two', 0.7, 0.7)
      setProperty('two.flipX', true)

	makeLuaSprite('carpet', 'laptop/song-icon/carpet', 765, 324);
	setLuaSpriteScrollFactor('carpet', 1, 1);
	scaleLuaSprite('carpet', 0.7, 0.7)

	makeLuaSprite('plush', 'laptop/song-icon/dad', 542, 377);
	setLuaSpriteScrollFactor('plush', 1, 1);
      setProperty('plush.flipX', true)
	scaleLuaSprite('plush', 0.7, 0.7)

	makeLuaSprite('mapped', 'laptop/text/tutorial', 530, 360);
	setLuaSpriteScrollFactor('mapped', 1, 1);
	scaleLuaSprite('mapped', 0.5, 0.5)

	makeLuaSprite('pic', 'laptop/text/pictures', 765, 360);
	setLuaSpriteScrollFactor('pic', 1, 1);
	scaleLuaSprite('pic', 0.5, 0.5)

	makeLuaSprite('piracy', 'laptop/text/bopeebo', 530, 420);
	setLuaSpriteScrollFactor('piracy', 1, 1);
	scaleLuaSprite('piracy', 0.5, 0.5)

	makeLuaSprite('self', 'laptop/text/pico', 617, 440);
	setLuaSpriteScrollFactor('self', 1, 1);
	scaleLuaSprite('self', 0.5, 0.5)
	setProperty('self.alpha', 0)

	makeLuaSprite('credit', 'laptop/screen/crewCredit', 0, 0);
	setLuaSpriteScrollFactor('credit', 1, 1);
	scaleLuaSprite('credit', 1, 1)
	setProperty('credit.visible', false)

	makeLuaSprite('crew', 'laptop/crew', 596, 300);
	setLuaSpriteScrollFactor('crew', 1, 1);
	scaleLuaSprite('crew', 0.6, 0.6)
	setProperty('crew.visible', false)

	makeLuaSprite('twoCrew', 'laptop/song-icon/two', 601, 324);
	setLuaSpriteScrollFactor('twoCrew', 1, 1);
	scaleLuaSprite('twoCrew', 0.6, 0.6)
	setProperty('twoCrew.visible', false)

	makeLuaSprite('vexCrew', 'laptop/icons/beast', 654, 320);
	setLuaSpriteScrollFactor('vexCrew', 1, 1);
	scaleLuaSprite('vexCrew', 0.6, 0.6)
	setProperty('vexCrew.visible', false)

	makeLuaSprite('chibi', 'laptop/song-icon/freddas', 611, 384);
	setLuaSpriteScrollFactor('chibi', 1, 1);
	scaleLuaSprite('chibi', 0.6, 0.6)
	setProperty('chibi.visible', false)

	makeLuaSprite('flaCrew', 'laptop/icons/fla', 601, 384);
	setLuaSpriteScrollFactor('flaCrew', 1, 1);
	scaleLuaSprite('flaCrew', 0.6, 0.6)
	setProperty('flaCrew.visible', false)

	makeLuaSprite('tCrew', 'laptop/song-icon/two', 655, 384);
	setLuaSpriteScrollFactor('twoCrew', 1, 1);
	scaleLuaSprite('tCrew', 0.6, 0.6)
	setProperty('tCrew.visible', false)

	makeLuaSprite('tCrew', 'laptop/song-icon/two', 655, 384);
	setLuaSpriteScrollFactor('twoCrew', 1, 1);
	scaleLuaSprite('tCrew', 0.6, 0.6)
	setProperty('tCrew.visible', false)

	makeLuaSprite('uCrew', 'laptop/icons/unk', 713, 384);
	setLuaSpriteScrollFactor('uCrew', 1, 1);
	scaleLuaSprite('uCrew', 0.6, 0.6)
	setProperty('uCrew.visible', false)

	makeLuaSprite('unCrew', 'laptop/icons/unk', 713, 324);
	setLuaSpriteScrollFactor('unCrew', 1, 1);
	scaleLuaSprite('unCrew', 0.6, 0.6)
	setProperty('unCrew.visible', false)

	makeLuaSprite('backL', 'laptop/back', 751, 424);
	setLuaSpriteScrollFactor('backL', 1, 1);
    setProperty('backL.visible', false)	

	makeLuaSprite('01', 'laptop/screen/beast', 0, 0);
	setLuaSpriteScrollFactor('01', 1, 1);
	scaleLuaSprite('01', 1, 1)
	setProperty('01.visible', false)

	makeLuaSprite('02', 'laptop/screen/vender', 0, 0);
	setLuaSpriteScrollFactor('02', 1, 1);
	scaleLuaSprite('02', 1, 1)
	setProperty('02.visible', false)

	makeLuaSprite('03', 'laptop/screen/fla', 0, 0);
	setLuaSpriteScrollFactor('03', 1, 1);
	scaleLuaSprite('03', 1, 1)
	setProperty('03.visible', false)

	makeLuaSprite('04', 'laptop/screen/two', 0, 0);
	setLuaSpriteScrollFactor('04', 1, 1);
	scaleLuaSprite('04', 1, 1)
	setProperty('04.visible', false)

	makeLuaSprite('05', 'laptop/screen/boobs', 0, 0);
	setLuaSpriteScrollFactor('05', 1, 1);
	scaleLuaSprite('05', 1, 1)
	setProperty('05.visible', false)

	makeLuaSprite('backR', 'laptop/back', 751, 424);
	setLuaSpriteScrollFactor('backR', 1, 1);
    setProperty('backR.visible', false)	

	makeLuaSprite('arrow', 'laptop/mouse', 0, 0);
	setLuaSpriteScrollFactor('arrow', 1, 1);
	scaleLuaSprite('arrow', 0.5, 0.5)

	makeLuaSprite('load', 'laptop/screen/loading', 0, 0);
	setLuaSpriteScrollFactor('load', 1, 1);
	scaleLuaSprite('load', 1, 1)

	makeLuaSprite('back', 'laptop/bg/all', 0, 0);
	setLuaSpriteScrollFactor('back', 1, 1);
	scaleLuaSprite('back', 1, 1)

	makeLuaSprite('controls', 'laptop/controls', -40, 5);
	setLuaSpriteScrollFactor('controls', 1, 1);
	scaleLuaSprite('controls', 1, 1)

	--place
	addLuaSprite('black', false);
	addLuaSprite('bar', false);
	addLuaSprite('song', false);
	addLuaSprite('home', false);
	addLuaSprite('two', false);
	addLuaSprite('carpet', false);
	addLuaSprite('plush', false);
	addLuaSprite('mapped', false);
	addLuaSprite('pic', false);
	addLuaSprite('piracy', false);
	addLuaSprite('self', false)
	addLuaSprite('load', true);
	addLuaSprite('back', true);
	addLuaSprite('credit', false)
	addLuaSprite('crew', false)
	addLuaSprite('twoCrew', false)
	addLuaSprite('vexCrew', false)
	addLuaSprite('chibi', false)
	addLuaSprite('flaCrew', false)
	addLuaSprite('tCrew', false)
	addLuaSprite('uCrew', false)
	addLuaSprite('unCrew', false)
	addLuaSprite('twoText', true)
	addLuaSprite('vexText', true)
	addLuaSprite('songText', true)
	addLuaSprite('backL', false)
	addLuaSprite('01', false)
	addLuaSprite('02', false)
	addLuaSprite('03', false)
	addLuaSprite('04', false)
	addLuaSprite('05', false)
	addLuaSprite('backR', false)
	addLuaSprite('arrow', false)
	addLuaSprite('controls', true)

      runTimer('loadScreen', 5, 1)

end

function onCreatePost()
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('gf.visible', false)
	setProperty('dad.visible', false)
end

function onUpdatePost()
    mouseXPos = getMouseX('other')
    mouseYPos = getMouseY('other')
    setProperty('arrow.x', mouseXPos)
    setProperty('arrow.y', mouseYPos)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loadScreen' then
		doTweenAlpha('complete', 'load', 0, 0.5, 'linear')
	end
end