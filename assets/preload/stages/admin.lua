IntroTextSize = 20
IntroSubTextSize = 20
IntroTagColor = 'ffffff'
IntroTagWidth = 15
Name = 'Adrenaline'
Author = 'Rundown'

local xx = -300;
local yy = 180;
local xx2 = 150;
local yy2 = 180;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local message = false;

--makeLuaSprite('ct', 'adminchairsntv', -1400, -600);

function onCreate()

	makeLuaSprite('JukeBoxTag', 'empty', -375-IntroTagWidth, 175)
	makeGraphic('JukeBoxTag', 370+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	setProperty('JukeBoxTag.alpha', 0)
	addLuaSprite('JukeBoxTag', true)

	makeLuaSprite('JukeBox', 'empty', -425-IntroTagWidth, 175)
	makeGraphic('JukeBox', 420, 100, 'ffffff')
	setProperty('JukeBox.alpha', 0.6)
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 180)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText', true)
	
	makeLuaText('JukeBoxSubText', Name, 300, -305-IntroTagWidth, 180)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText', true)
	
	makeLuaText('JukeBoxText2', 'Composer:', 300, -305-IntroTagWidth, 210)
	setTextAlignment('JukeBoxText2', 'left')
	setObjectCamera('JukeBoxText2', 'other')
	setTextSize('JukeBoxText2', IntroTextSize)
	addLuaText('JukeBoxText2', true)
	
	makeLuaText('JukeBoxSubText2', Author, 300, -305-IntroTagWidth, 210)
	setTextAlignment('JukeBoxSubText2', 'left')
	setObjectCamera('JukeBoxSubText2', 'other')
	setTextSize('JukeBoxSubText2', IntroSubTextSize)
	addLuaText('JukeBoxSubText2', true)
	
	makeLuaText('JukeBoxText3', 'Art & Animations:', 300, -305-IntroTagWidth, 240)
	setTextAlignment('JukeBoxText3', 'left')
	setObjectCamera('JukeBoxText3', 'other')
	setTextSize('JukeBoxText3', IntroTextSize)
	--if FanAuthorOn == true then 
		addLuaText('JukeBoxText3')
	--end
	
	makeLuaText('JukeBoxSubText3', 'Ameshi & Scissor', 300, -305-IntroTagWidth, 240)
	setTextAlignment('JukeBoxSubText3', 'left')
	setObjectCamera('JukeBoxSubText3', 'other')
	setTextSize('JukeBoxSubText3', IntroSubTextSize)
	--if FanAuthorOn == true then 
		addLuaText('JukeBoxSubText3')
	--end

makeLuaSprite('v', 'vignette', 0, 0);
makeLuaSprite('b', 'blackout', 0, 0);


makeLuaSprite('ov1', 'adminoverlay1', -1600, -1100);
makeLuaSprite('ov2', 'adminoverlay2', -1600, -1100);
makeLuaSprite('bg', 'admin', -1400, -600);
makeLuaSprite('bodies', 'adminbodies', -1200, -600);
makeLuaSprite('ct', 'adminchairs', -1560, -640);
makeAnimatedLuaSprite('t', 'tableadmin', -500, 120)
addAnimationByPrefix('t', 'ta', 'table', 24, true)
makeAnimatedLuaSprite('tv', 'admintv', -950, -650)
addAnimationByPrefix('tv', 'tvanim', 'tvtv', 24, true)
makeLuaSprite('back', 'back', -1250, -700);
scaleObject('back', 2, 1.2)


addLuaSprite('ct', true);
addLuaSprite('tv', true);
addLuaSprite('ov1', true);
addLuaSprite('ov2', true);
addLuaSprite('bodies', false);
addLuaSprite('bg', false);
addLuaSprite('t', false);
addLuaSprite('back', false);
setScrollFactor('ct', 1.2, 1.2)
setScrollFactor('tv', 1.2, 1.2)

addLuaSprite('v', true);
setObjectCamera('v', 'other')

addLuaSprite('b', true);
setObjectCamera('b', 'other')

end

function onCreatePost()

setProperty('gf.visible', false)

setProperty('bg.alpha', 0)
setProperty('bodies.alpha', 0)
setProperty('t.alpha', 0)
setProperty('ct.alpha', 0.3)
setProperty('tv.alpha', 0.3)

setProperty('ov1.alpha', 0)
setProperty('ov2.alpha', 0)
setProperty('back.alpha', 0.4)
setProperty('b.alpha', 0.2)

setObjectOrder('bg', 1)
setObjectOrder('bodies', 2)
setObjectOrder('t', 3)
setObjectOrder('tv', 4)
setObjectOrder('back', 5)
setObjectOrder('gfGroup', 6)
setObjectOrder('boyfriendGroup', 7)
setObjectOrder('dadGroup', 8)
setObjectOrder('ct', 9)
setObjectOrder('ov1', 10)
setObjectOrder('ov2', 11)

setProperty('healthBarBG.alpha', 0)
setProperty('healthBar.alpha', 0)
setProperty('scoreTxt.alpha', 0)
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)

end

function onBeatHit()
end

function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag
	
end

function onStartCountdown()

end

function onSongStart()

end

function onUpdate() -- The Main Code
    if curStep == 1 then
        setProperty('defaultCamZoom', 0.9)
        doTweenAlpha('vignetecas', 'v', 1, 0.25, 'expoOut')
    end


if curStep == 128 then

    doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'expoInOut')
    doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'expoInOut')
    doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'expoInOut')
    doTweenX('MoveInFour', 'JukeBoxSubText', 160, 1, 'expoInOut')
    doTweenX('MoveInFive', 'JukeBoxText2', 10, 1, 'expoInOut')
    doTweenX('MoveInSix', 'JukeBoxSubText2', 120, 1, 'expoInOut')
    doTweenX('MoveInSeven', 'JukeBoxText3', 10, 1, 'expoInOut')
    doTweenX('MoveInEight', 'JukeBoxSubText3', 215, 1, 'expoInOut')
    
    doTweenColor('txtColor', 'JukeBoxSubText', '7B2AD7', 4, 'expoInOut')
    
    runTimer('JukeBoxWait', 5, 1)

    yy = 130
    xx = -150
    yy2 = 130
    xx2 = -50
doTweenColor('color', 'scoreTxt', '7B2AD7', 0.25, 'expoOut')

doTweenAlpha('back', 'back', 0, 0.25)
doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.25)
doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.25)
doTweenAlpha('healthBar', 'healthBar', 1, 0.25)
doTweenAlpha('iconP2', 'iconP2', 1, 0.5)

doTweenAlpha('b', 'bodies', 1, 1, 'expoOut')
doTweenAlpha('bgg', 'bg', 1, 1, 'expoOut')
doTweenAlpha('tt', 't', 1, 1, 'expoOut')
doTweenAlpha('cts', 'ct', 1, 1, 'expoOut')
doTweenAlpha('ctsv', 'tv', 1, 1, 'expoOut')
doTweenAlpha('vignetecas', 'v', 0, 10, 'expoOut')
doTweenAlpha('bbb', 'b', 0, 10, 'expoOut')
setProperty('defaultCamZoom', 0.65)
end

if curStep == 192 then
    doTweenAlpha('iconP1', 'iconP1', 1, 0.5)
end

if curStep == 240 then
    setProperty('defaultCamZoom', 0.8)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)

    xx2 = 150
    yy2 = 180
end

if curStep == 246 then
    setProperty('defaultCamZoom', 0.9)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 252 then
    setProperty('defaultCamZoom', 1.0)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 256 then
    setProperty('defaultCamZoom', 0.65)

    yy2 = 130
    xx2 = -50
doTweenAlpha('ov2appear', 'ov2', 0.5, 10, 'expoOut')
setProperty('defaultCamZoom', 0.55)
end


if curStep == 320 then
    setProperty('defaultCamZoom', 0.8)
    xx = -300
    yy = 160
end

if curStep == 384 then
    lights = true
    setProperty('defaultCamZoom', 0.65)
    yy = 130
    xx = -150
end

if curStep == 448 then
    setProperty('defaultCamZoom', 0.8)

    xx2 = 150
    yy2 = 160

    doTweenAlpha('bg', 'bg', 0, 5)
    doTweenAlpha('bodies', 'bodies', 0, 5)
    doTweenAlpha('t', 't', 0, 5)
    doTweenAlpha('ct', 'ct', 0.3, 5)
    doTweenAlpha('tv', 'tv', 0.3, 5)
    doTweenAlpha('b', 'b', 0.2, 5)
    doTweenAlpha('vignetecas', 'v', 1, 5, 'expoOut')
end

if curStep == 512 then
    lights = false
    setProperty('defaultCamZoom', 0.8)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)

    xx = -300
    yy = 180
    xx2 = 150
    yy2 = 180

    doTweenAlpha('b', 'bodies', 1, 1, 'expoOut')
    doTweenAlpha('bgg', 'bg', 1, 1, 'expoOut')
    doTweenAlpha('tt', 't', 1, 1, 'expoOut')
    doTweenAlpha('cts', 'ct', 1, 1, 'expoOut')
    doTweenAlpha('ctsv', 'tv', 1, 1, 'expoOut')
    doTweenAlpha('vignetecas', 'v', 0, 10, 'expoOut')
    doTweenAlpha('bbb', 'b', 0, 10, 'expoOut')
end

if curStep == 518 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 524 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 530 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 536 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 540 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 544 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 550 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 556 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 562 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 568 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 572 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 576 then
    triggerEvent('Camera Follow Pos',xx2,yy2)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 582 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 588 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 594 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 600 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 604 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 608 then
    triggerEvent('Camera Follow Pos',xx,yy)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 614 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 620 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 626 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 632 then
    yy = 130
    xx = -150
    yy2 = 130
    xx2 = -50
    setProperty('defaultCamZoom', 0.7)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 640 then
end

if curStep == 704 then
    xx2 = 150
    yy2 = 180
    setProperty('defaultCamZoom', 0.75)
end

if curStep == 718 then
    setProperty('defaultCamZoom', 0.85)
end

if curStep == 724 then
    setProperty('defaultCamZoom', 0.8)
end

if curStep == 734 then
    setProperty('defaultCamZoom', 0.9)
end

if curStep == 740 then
    setProperty('defaultCamZoom', 0.8)
end

if curStep == 750 then
    setProperty('defaultCamZoom', 1)
end

if curStep == 756 then
    setProperty('defaultCamZoom', 0.85)
end

if curStep == 768 then
    yy2 = 130
    xx2 = -50
    setProperty('defaultCamZoom', 0.7)
    lights = true
end

if curStep == 896 then
    lights = false
    setProperty('defaultCamZoom', 1)
    xx = -300
    yy = 180

    doTweenAlpha('vignetecas', 'v', 0.9, 1.5, 'expoOut')
    doTweenAlpha('back', 'back', 0.8, 1.5, 'expoOut')

    doTweenAlpha('bg', 'bg', 0, 0.25)
    doTweenAlpha('bodies', 'bodies', 0, 0.25)
    doTweenAlpha('t', 't', 0, 0.25)
    doTweenAlpha('ct', 'ct', 0.3, 0.25)
    doTweenAlpha('tv', 'tv', 0.3, 0.25)
    doTweenAlpha('ov1', 'ov1', 0, 0.25)
    doTweenAlpha('ov2', 'ov2', 0, 0.25)
    doTweenAlpha('b', 'b', 0.2, 0.25)

    doTweenAlpha('healthBarBG', 'healthBarBG', 0, 0.25)
    doTweenAlpha('healthBar', 'healthBar', 0, 0.25)
    doTweenAlpha('iconP1', 'iconP1', 0, 0.25)
    doTweenAlpha('iconP2', 'iconP2', 0, 0.25)
end

if curStep == 912 then
    yy = 130
    xx = -150
    doTweenAlpha('redback', 'back', 0.75, 1, 'expoOut')
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
    setProperty('defaultCamZoom', 0.9)
end

if curStep == 918 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
    setProperty('defaultCamZoom', 0.8)
end

if curStep == 924 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
    setProperty('defaultCamZoom', 0.75)
end

if curStep == 928 then
    doTweenColor('color', 'scoreTxt', '7B2AD7', 0.25, 'expoOut')

doTweenAlpha('redback', 'back', 0, 0.25, 'expoOut')
doTweenAlpha('vignetecas', 'v', 0, 0.25, 'expoOut')

doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.25)
doTweenAlpha('healthBarBG', 'healthBarBG', 1, 0.25)
doTweenAlpha('healthBar', 'healthBar', 1, 0.25)
doTweenAlpha('iconP2', 'iconP2', 1, 0.5)

doTweenAlpha('b', 'bodies', 1, 1, 'expoOut')
doTweenAlpha('bgg', 'bg', 1, 1, 'expoOut')
doTweenAlpha('tt', 't', 1, 1, 'expoOut')
doTweenAlpha('cts', 'ct', 1, 1, 'expoOut')
doTweenAlpha('ctsv', 'tv', 1, 1, 'expoOut')
doTweenAlpha('ov2appear', 'ov2', 1, 1, 'expoOut')
doTweenAlpha('ov1appear', 'ov1', 1, 10, 'expoOut')
setProperty('defaultCamZoom', 0.55)
doTweenAlpha('bbbb', 'b', 0.2, 10, 'expoOut')
doTweenAlpha('vignetecas2', 'v', 0.6, 5, 'expoOut')
end

if curStep == 1056 then
    lights = true
    setProperty('defaultCamZoom', 0.9)
    xx = -300
    yy = 180
    xx2 = 150
    yy2 = 180
end

if curStep == 1104 then
    setProperty('defaultCamZoom', 0.75)
end

if curStep == 1112 then
    setProperty('defaultCamZoom', 0.85)
end

if curStep == 1120 then
    yy = 130
    xx = -150
    yy2 = 130
    xx2 = -50
end

if curStep == 1248 then
    xx2 = 150
    yy2 = 180
end

if curStep == 1296 then
    setProperty('defaultCamZoom', 0.95)
end

if curStep == 1304 then
    setProperty('defaultCamZoom', 1.05)
end

if curStep == 1312 then
    lights = false
    setProperty('defaultCamZoom', 0.55)
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
    yy2 = 130
    xx2 = -50
end

if curStep == 1316 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1318 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1322 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1324 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1328 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1330 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1334 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1336 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1340 then
    triggerEvent('Add Camera Zoom', 0.0015, 0.0015)
end

if curStep == 1344 then
    xx = -300
    yy = 180
setProperty('defaultCamZoom', 0.85)
end

if curStep == 1376 then
    yy = 130
    xx = -150

setProperty('camGame.visible', false)
setProperty('camHUD.visible', false)
end

if curStep == 1380 then
    makeLuaSprite('flash', '', 0, 0);
    makeGraphic('flash',1280,720,'ffffff')
      addLuaSprite('flash', true);
      setScrollFactor('flash',0,0)
      setProperty('flash.scale.x',2)
      setProperty('flash.scale.y',2)
      setProperty('flash.alpha',0)
    setObjectCamera('flash', 'other')
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -520, 1.5, 'expoInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -520, 1.5, 'expoInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'expoInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'expoInOut')
		doTweenX('MoveOutFive', 'JukeBoxText2', -450, 1.5, 'expoInOut')
		doTweenX('MoveOutSix', 'JukeBoxSubText2', -450, 1.5, 'expoInOut')
		doTweenX('MoveInSeven', 'JukeBoxText3', -450, 1.5, 'expoInOut')
		doTweenX('MoveInEight', 'JukeBoxSubText3', -450, 1.5, 'expoInOut')
	end
end

function onEndSong()

    setProperty('flash.alpha',1)
    if not allowEnd and isStoryMode then
        startVideo('SEXfunkcut');
        allowEnd = true;
        return Function_Stop;
    end
    return Function_Continue;

end


	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
		
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
    
end






















