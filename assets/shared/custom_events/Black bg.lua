function onEvent(n,v1,v2)


	if n == 'Black bg' then

	   makeLuaSprite('blackbg', '', 0, 0);
        makeGraphic('blackbg',1280,720,'000000')
	      addLuaSprite('blackbg', false);
	      setLuaSpriteScrollFactor('blackbg',0,0)
	      setProperty('blackbg.scale.x',4)
	      setProperty('blackbg.scale.y',4)
		setProperty('blackbg.alpha',1)
	end



end