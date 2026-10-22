function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_ourple')
	makeLuaSprite('backstage','bg/bckrom', -550,-580)
	scaleObject('backstage', 1.75, 1.75)
	updateHitbox('backstage')
	addLuaSprite('backstage',false)
    makeLuaSprite('blackScreen', '', 0, 0)
    makeGraphic('blackScreen', screenWidth * 2, screenHeight * 2, '000000')
    setObjectCamera('blackScreen', 'camOther')
    setProperty('blackScreen.alpha', 0) -- Начинаем с невидимого
    setProperty('blackScreen.visible', false) -- Скрываем полностью
    addLuaSprite('blackScreen', true)
end