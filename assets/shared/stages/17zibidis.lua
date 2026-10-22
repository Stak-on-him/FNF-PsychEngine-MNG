function onCreate() 

	makeLuaSprite('stageback', 'bg/gradientbg', -2170, -2525);
	scaleObject('stageback', 12, 3);
	setScrollFactor('stageback', 1, 1);
	setScrollFactor('gf', 0, 0);
	addLuaSprite('stageback', false);
	--setProperty('gf', 1405, 1140);

	close(true);

end