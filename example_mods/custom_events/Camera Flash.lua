function onEvent(name, value1, value2)
	if getPropertyFromClass('ClientPrefs', 'flashing') == true then
    	if name == "Camera Flash" then
			cameraFlash('camother', '' .. value1, value2, true)
		end
	end
end