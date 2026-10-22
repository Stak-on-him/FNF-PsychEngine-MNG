import objects.BGSprite;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;

FlxG.camera.bgColor = FlxColor.fromHSL(0, 0, 1);
game.camZooming = true;
game.camZoomingMult = 1.5;
game.camZoomingDecay = 1.25;

final barThiccnes = 55;
var dudes;
var dudesFunnyBounce:Bool = true;
var city;

var bUp, bDown;
function onCreate() {
	addBehindGF(city = new BGSprite("stages/city", -2000, -1000, .5, .5));
	addBehindGF(new BGSprite("stages/floor", -1750, -1000, .9, .9));
	addBehindGF(dudes = new BGSprite("stages/dudes", -300, 150, .9, .9, ["lolol"], true));
	dudes.scale.set(.9, .9); dudes.updateHitbox();
	dudes.angle = 1.5;
	dudes.origin.set(dudes.width/2, dudes.height - 75);

	city.origin.set(city.width/2, city.height - 15);

	bUp = new FlxSprite();
	bDown = new FlxSprite(0, FlxG.height - barThiccnes);
	for (b in [bUp, bDown]) {
		b.makeGraphic(1, 1, FlxColor.BLACK);
		b.scale.set(FlxG.width * 1.25, barThiccnes);
		b.updateHitbox();
		b.screenCenter(0x01);
		insert(0, b);
	}
	return Function_Continue;
}

function onSongStart() {
	doLinesBop();
	return Function_Continue;
}

function onUpdate(e) {
	if (FlxG.keys.justPressed.FIVE) dudesFunnyBounce = !dudesFunnyBounce;

	return Function_Continue;
}

function onBeatHit() {
	doDudesBop(curBeat);
	return Function_Continue;
}

var cityTween = null;
function onSectionHit() {
	if (cityTween != null) cityTween.cancel();

	city.scale.x *= 1.005;
	city.scale.y *= 1 - 0.005;
	cityTween = FlxTween.tween(city.scale, {x: 1, y: 1}, Conductor.stepCrochet / 250, {ease: FlxEase.cubeOut, onComplete: (_) -> cityTween = null});

	return Function_Continue;
}

function onCountdownTick(tick, swaggyTick)
{
	doDudesBop(swaggyTick);
	
	if (swaggyTick == 1 && (camZooming && FlxG.camera.zoom < 1.35 && ClientPrefs.data.camZooms)) doLinesBop();

	
	return Function_Continue;
}

final bounceStrength = .025;
var dudesTween = null;
function doDudesBop(bb) {
	if (Conductor.bpm > 180 && bb % 2 != 0) return;
 
	if (dudesFunnyBounce) {
		if (dudesTween != null) dudesTween.cancel();
		dudes.scale.x *= .99 * (1 + bounceStrength);
		dudes.scale.y *= (1 - bounceStrength);
		dudesTween = FlxTween.tween(dudes.scale, {y: 0.9, x: 0.9}, Conductor.bpm > 180 ? Conductor.stepCrochet / 125 : Conductor.stepCrochet / 250, {ease: FlxEase.cubeOut, onComplete: (_) -> dudesTween = null});
	}
}

var linesUpDown:Bool = true;
function doLinesBop() {
	final where = linesUpDown ? 5 : -5;

	FlxTween.cancelTweensOf(bUp);
	bUp.y = where;
	FlxTween.tween(bUp, {y: 0}, Conductor.stepCrochet / 250, {ease: FlxEase.cubeOut});

	FlxTween.cancelTweensOf(bDown);
	bDown.y = FlxG.height - barThiccnes - where;
	FlxTween.tween(bDown, {y: FlxG.height - barThiccnes}, Conductor.stepCrochet / 250, {ease: FlxEase.cubeOut});

	linesUpDown = !linesUpDown;
}


	
function onDestroy() FlxG.camera.bgColor = FlxColor.BLACK;

/*
* Made by PurSnake
* God, i hate psych
* Huff, i did pretty well, due psych hscript limitations
*/