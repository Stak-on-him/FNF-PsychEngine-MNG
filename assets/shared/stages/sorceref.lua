function onCreatePost()
	makeLuaSprite("white", "", -1000, -1000)
	makeGraphic("white", 5000, 5000, "ffffff")
	addLuaSprite("white", false)
	
	makeLuaSprite("bg", "sorceref", -900, -1000)
	scaleObject("bg", 1.60, 2.45)
	addLuaSprite("bg", false)
	setProperty("bg.alpha", 1)
end