var bg:FunkinSprite = null;

var bgShader:FlxRuntimeShader = null;

function onReady():Void {
	bg = new FunkinSprite().makeSolidColor(2400.0, 2400.0, 0xffff0000);
	bg.screenCenter();
	bg.cameras = [camGame];
	addBehindGF(bg);
	bg.scrollFactor.set();
	
	bgShader = createRuntimeShader('miss-me');
	bgShader.setFloatArray('u_scale', [2.0, 2.0]);
	bgShader.setFloat('u_time', 0.0);
	bgShader.setFloat('u_mix', 0.0);
	bg.shader = bgShader;
	
	setGlobalVar('bgShader', bgShader);
}

function onUpdatePost(elapsed:Float):Void {
	if (bgShader != null) {
		bgShader.setFloatArray('u_offset', [
			0.5 * ncGame.position.x.applied / 2400.0,
			0.5 * ncGame.position.y.applied / 2400.0
		]);
		
		bgShader.setFloat('u_time', getShaderTime());
	}
}

function getShaderTime():Float {
	var beatDec:Float = Conductor.songPosition / Conductor.crochet;
	return 100.0 * (Math.floor(FlxMath.mod(beatDec, 16.0) / 8.0) + Math.floor(FlxMath.mod(beatDec, 16.0) / 11.0) + 3.0 * Math.floor(beatDec / 16.0)) + 0.5 * Conductor.songPosition / 1000.0;
}
