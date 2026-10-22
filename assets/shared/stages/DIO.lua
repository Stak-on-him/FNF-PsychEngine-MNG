function onCreate() 

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_ourple')
	makeLuaSprite('backstage','bg/c-1', -1500, -800)
	scaleObject('backstage', 2, 1.2)
	updateHitbox('backstage')
	setProperty('backstage.antialiasing', false)
	addLuaSprite('backstage',false)
	setScrollFactor('gfGroup', 0.8, 0.8)
	close(true)

end