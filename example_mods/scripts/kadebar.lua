--CREDIT TO 1F1D ON GAMEBANANA FOR MAKING THIS SCRIPT
--CREDIT TO Tomek*Tomciok*Przybysz ON GAMEBANANA FOR FIXING THE SCRIPT
function onCreatePost()

makeLuaText("nametext", songName, 0, 120, 21.8)
setTextSize('nametext', 13.5)
setTextAlignment('nametext', 'left')
setTextFont("scoretext", "vcr.ttf");
setTextBorder("nametext", 1.3, '000001')
addLuaText("nametext")

setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeTxt.visible', false)
end

function onCreate()

makeLuaSprite('black', 'black', 95.85, 19.25)
makeLuaSprite('white', 'whiteish', 98.35, 22.25)
makeLuaSprite('gray', 'gray', 103, 25.25)
makeLuaSprite('green', 'green', 103, 25.25)

addLuaSprite('black', true)
addLuaSprite('white', true)
addLuaSprite('gray', true)
addLuaSprite('green', true)

setObjectCamera('black', 'hud')
setObjectCamera('white', 'hud')
setObjectCamera('gray', 'hud')
setObjectCamera('green', 'hud')

scaleObject('black', 1.298, .075)
scaleObject('white', 1.285, .055)
scaleObject('gray', 1.265, .035)
scaleObject('green', 1.265, .035)

end

function onUpdate()
    scaleObject('green', 1.265 * getProperty("songPercent"), .035)

    if downscroll then -- downscroll only
        setProperty('black.y', 685)
        setProperty('white.y', 685)
        setProperty('gray.y', 690)
        setProperty('green.y', 690)
        setProperty('nametext.y', 687)
    end
end
