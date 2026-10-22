local cuptext = false

function onEvent(name,v1,v2)
	if name == 'Text' then

		makeLuaText('text', v1, 350, -50, 300)
		addLuaText('text')
		setTextSize('text', 40)

		if v2 == 'Cuphead' then
			cuptext = true
		end

		if cuptext == true then
			setTextSize('text', 100)

			setTextFont('text', 'ZillaSlabBold.ttf')
			setProperty('text.x', 450)
		end
	end
end