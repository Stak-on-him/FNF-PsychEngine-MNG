function onCreate()
	makeLuaSprite('bg', 'ourple/freeplaywall', 0, 0)
	addLuaSprite('bg')
    setProperty('bg.antialiasing', false)

	makeLuaSprite('hit', 'ourple/hit', 710, 160)
	setProperty('hit.visible', false)
	addLuaSprite('hit', true)

	makeLuaSprite('hit2', 'ourple/hit', -40, 160)
	setProperty('hit2.visible', false)
	addLuaSprite('hit2')

	makeLuaSprite('hit3', 'ourple/hit', 710, 160)
	setProperty('hit3.visible', false)
	addLuaSprite('hit3')

	makeAnimatedLuaSprite('aRight', 'ourple/arrow', 630, 350)
    addAnimationByPrefix('aRight', 'no', 'no', 12, true)
    addAnimationByPrefix('aRight', 'yes', 'yes', 12, true)
    objectPlayAnimation('aRight', 'no', false)
	setProperty('aRight.antialiasing', false)
    addLuaSprite('aRight', true)

	makeAnimatedLuaSprite('aLeft', 'ourple/arrow', 230, 350)
    addAnimationByPrefix('aLeft', 'no', 'no', 12, true)
    addAnimationByPrefix('aLeft', 'yes', 'yes', 12, true)
    objectPlayAnimation('aLeft', 'no', false)
	setProperty('aLeft.antialiasing', false)
	setProperty('aLeft.flipX', true)
    addLuaSprite('aLeft', true)

	makeLuaSprite('read', 'ourple/freeplaywelcome', 297.5, 320)
	setScrollFactor('read', 1, 1);
    scaleObject('read', 0.3, 0.3);
	addLuaSprite('read', true)
    setProperty('read.antialiasing', false)

	makeLuaSprite('blind', 'ourple/blind', 0, 0)
	setScrollFactor('blind', 1, 1);
	addLuaSprite('blind')

	makeLuaSprite('controls', 'ourple/controls', 63, 136)
	setScrollFactor('controls', 1, 1);
	scaleObject('controls', 0.6, 0.6);
	addLuaSprite('controls', true)
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

function onUpdate()
   if keyPressed('left') then
	objectPlayAnimation('aLeft', 'yes', false)
   else
	objectPlayAnimation('aLeft', 'no', false)
   end
   if keyPressed('right') then
	objectPlayAnimation('aRight', 'yes', false)
   else
	objectPlayAnimation('aRight', 'no', false)
   end
end