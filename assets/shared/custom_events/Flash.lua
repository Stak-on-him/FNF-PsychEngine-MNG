-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Flash" then
		cameraFlash('game', 'ffffff', 0.6, true)
	end
end