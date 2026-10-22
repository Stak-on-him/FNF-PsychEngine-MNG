function onCreate()
    makeAnimatedLuaSprite('bool', 'songs/boolean/lean', -400, -200);
    addAnimationByPrefix('bool', 'bitch', 'bitch', 24, true);
    setObjectCamera('bool', 'camGame');
    setObjectOrder('bool', 1)
    scaleObject('bool',3,3)
    setScrollFactor('bool', 0.4, 0.4); 
    addLuaSprite('bool', false);
    setProperty('camGame.bgColor', getColorFromHex('000000'))
    close(true)
end