function onCreatePost()
	makeLuaSprite("white", "", -100, -100)
	makeGraphic("white", 5000, 5000, "ffffff")
	addLuaSprite("white", false)
	
	makeLuaSprite("bg", "15seizref", -900, -900)
	scaleObject("bg", 1.60, 2.45)
	addLuaSprite("bg", false)
	setProperty("bg.alpha", 1)
end