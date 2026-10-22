function onCreate()
makeAnimatedLuaSprite('flicks','characters/flick-blox',550,-300)addAnimationByPrefix('flicks','dance','FLICK',24,true)
addAnimationByPrefix('flicks','dies','flickdeath',24,true)
addAnimationByPrefix('flicks','looping','deathlooppose',24,true)
end

function onCreatePost()
makeLuaSprite("white", "", 0, 0)
makeGraphic("white", 1, 1, "ffffff")
scaleObject("white", 3000, 3000)
addLuaSprite("white", false)

makeLuaSprite("bg", "donerbg", -1050, -932)
scaleObject("bg", 1.45, 1.45)
addLuaSprite("bg", false)
setProperty("bg.alpha", 1)

objectPlayAnimation('flicks','dance',false)
addLuaSprite('flicks', false);
end

function onBeatHit()
if beat_events[curBeat] then
beat_events[curBeat]()
end
end

local beat_events = {
[158] = function()
objectPlayAnimation('flicks','looping',false)

end,

[156] = function()
objectPlayAnimation('flicks','dies',false)
addOffset('flicks', 'dies', 550, -300)
end
}

function onBeatHit()
if beat_events[curBeat] then
beat_events[curBeat]()
end
end