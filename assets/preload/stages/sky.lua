local allowCountdown = false

IntroTextSize = 20
IntroSubTextSize = 20
IntroTagColor = 'ffffff'
IntroTagWidth = 15
Name = 'Interstellar'
Author = 'GUMVY & _Fusion_'

eT = 0 --elapsed time
reach = {
  x = 1.5,
  y = 1.5
}
speed = {
  x = 2,
  y = 2
}
offset = {
  x = 0,
  y = 0
}


bfreach = {
    x = -1.1,
    y = -1.1
  }

bfspeed = {
  x = 2,
  y = 2
}
bfoffset = {
    x = 3,
    y = 0
  }

local xx = -220;
local yy = 130;
local xx2 = -50
local yy2 = 130
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local message = false;

local WindowDance = false
local WindowDance2 = false
local SineElap = 0
local DanceAmt = 0.6




function onCreate()

setProperty('skipCountdown', true)


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

makeLuaText('JukeBoxText2', 'Composers:', 300, -305-IntroTagWidth, 210)
setTextAlignment('JukeBoxText2', 'left')
setObjectCamera('JukeBoxText2', 'other')
setTextSize('JukeBoxText2', 19)
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

setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
setProperty('showComboNum', false);
setProperty('showRating', false);

--makeLuaSprite('v', 'vignette', 0, 0);
--makeLuaSprite('b', 'blackout', 0, 0);

makeLuaSprite('bg', 'interstellar/skyfall', -2000, -700);
makeLuaSprite('cf', 'interstellar/cloudsfall', -3000, -1000);
makeLuaSprite('sl', 'interstellar/speedLines', -1200, 1200);
makeLuaSprite('bld', 'interstellar/bluedead', 1600, -200);
scaleObject('bld', 0.9,0.9)
setScrollFactor('bld', 1.15,1.15)
makeLuaSprite('brd', 'interstellar/browndead', 1500, -450);
scaleObject('brd', 0.7,0.7)
setScrollFactor('brd', 1.3,1.3)

makeLuaSprite('ship', 'interstellar/ship', 1800, -500);


makeLuaSprite('tr', 'interstellar/trash', 1800, 200);
makeLuaSprite('pb', 'interstellar/planetbelow', -2200, 4000)
setScrollFactor('tr', 1.3,1.3)

setScrollFactor('cf', 1.2,1.2)
scaleObject('cf', 2,2)
scaleObject('tr', 0.8,0.8)

makeAnimatedLuaSprite('cs', 'interstellar/scrollingClouds', -1500,720)
--addAnimationByPrefix('cs', 'move', 'Cloud', 24, true)

makeLuaSprite('cs2', 'interstellar/cloudsfall', -3000, -1000);
scaleObject('cs2', 2,2)

--makeLuaSprite('blackbackground', 'interstellar/black', -3000, -7000);
--scaleObject('blackbackground', 100,100)

addLuaSprite('bg',false);
addLuaSprite('pb',false);
addLuaSprite('cf',false);
addLuaSprite('brd', false);
addLuaSprite('bld', false);
addLuaSprite('tr',false);
addLuaSprite('ship', false);


addLuaSprite('sl',true);
addLuaSprite('cs',true);
addLuaSprite('cs2',true);
--addLuaSprite('blackbackground',true);
--addLuaSprite('t', false);
setProperty('cs.alpha', 0.5)
setProperty('cs2.alpha', 0.2)

doTweenX('cloudfalltween','cf',-3000,240,'linear')  

windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
windowx = getPropertyFromClass("openfl.Lib", "application.window.x")

setPropertyFromClass('openfl.Lib', 'application.window.y', windowy)
setPropertyFromClass('openfl.Lib', 'application.window.x', windowx)
setProperty('pb.visible', false)
end

function onStepHit()

    if curStep == 69 then
        setProperty('blackbackground.alpha', 0)
		
    end

    if curStep == 128 then
        WindowDance = true
setProperty('skyfall.alpha', 0)
        triggerEvent('Add Camera Zoom', '', 3)

        runTimer('JukeBoxWait', 5, 1)

        makeLuaSprite('flash', '', 0, 0);
         makeGraphic('flash',1280,720,'ffffff')
           addLuaSprite('flash', true);
           setScrollFactor('flash',0,0)
           setProperty('flash.scale.x',2)
           setProperty('flash.scale.y',2)
           setProperty('flash.alpha',0)
         setProperty('flash.alpha',1)
         setObjectCamera('flash', 'other')
         doTweenAlpha('flTw','flash',0,0.6,'linear')

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

    end

    if curStep == 384 then

     followchars = false
     setProperty('defaultCamZoom', 0.75)
     triggerEvent('Camera Follow Pos', 300, yy2)

    end

    if curStep == 400 then
        WindowDance = false

        setPropertyFromClass('openfl.Lib', 'application.window.y', windowy)
        setPropertyFromClass('openfl.Lib', 'application.window.x', windowx)
        
        WindowDance2 = true

        followchars = true
        setProperty('defaultCamZoom', 0.4)

        setProperty('flash.alpha',1)
        doTweenAlpha('flTw','flash',0,0.6,'linear')

        setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
		setProperty('healthBar.visible', false);
		setProperty('healthBarBG.visible', false);
        setProperty('scoreTxt.visible', false);

        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

         doTweenY('opponentmoveYup', 'dadGroup', -530, 3)
         doTweenY('bfmoveYdown', 'boyfriendGroup', -30, 1.5)

         noteTweenY("noteY5", 4, 70, 6, "cubeInOut")
	     noteTweenY("noteY6", 5, 70, 6, "cubeInOut")
		 noteTweenY("noteY7", 6, 70, 6, "cubeInOut")
		 noteTweenY("noteY8", 7, 70, 6, "cubeInOut")

         setPropertyFromGroup('playerStrums', 0, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', false)

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         doTweenY('opponentmoveYdown', 'dadGroup', -30, 1.5)
         doTweenY('bfmoveYup', 'boyfriendGroup', -530, 3)

         noteTweenY("noteY5", 4, 570, 6, "cubeInOut")
	     noteTweenY("noteY6", 5, 570, 6, "cubeInOut")
		 noteTweenY("noteY7", 6, 570, 6, "cubeInOut")
		 noteTweenY("noteY8", 7, 570, 6, "cubeInOut")

         setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', true)

        end
    end

    if curStep == 560 then

        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

         setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
         setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
         setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
         setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
         setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
         setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
         setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
        end
    end

    if curStep == 592 then

        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
            
         doTweenY('opponentmoveYdown', 'dadGroup', -30, 3)
            
         noteTweenY("noteY1", 0, 70, 6, "cubeInOut")
	     noteTweenY("noteY2", 1, 70, 6, "cubeInOut")
		 noteTweenY("noteY3", 2, 70, 6, "cubeInOut")
		 noteTweenY("noteY4", 3, 70, 6, "cubeInOut")

         
        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         doTweenY('opponentmoveYup', 'dadGroup', -530, 3)

            
         noteTweenY("noteY1", 0, 570, 6, "cubeInOut")
	     noteTweenY("noteY2", 1, 570, 6, "cubeInOut")
		 noteTweenY("noteY3", 2, 570, 6, "cubeInOut")
		 noteTweenY("noteY4", 3, 570, 6, "cubeInOut")
        end
    end

    if curStep == 656 then

        DanceAmt = 0.8
        
        doTweenX('bluedeadtween','bld',-2500,15,'linear')
        doTweenAngle('bluedeadtweenangle','bld',1080,40,'sineInOut')

        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
            
         doTweenY('bfmoveYup', 'boyfriendGroup', -530, 3)

         noteTweenY("noteY5", 4, 570, 6, "cubeInOut")
	     noteTweenY("noteY6", 5, 570, 6, "cubeInOut")
		 noteTweenY("noteY7", 6, 570, 6, "cubeInOut")
		 noteTweenY("noteY8", 7, 570, 6, "cubeInOut")
    
        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
    
         doTweenY('bfmoveYdown', 'boyfriendGroup', -30, 3)

         noteTweenY("noteY5", 4, 70, 6, "cubeInOut")
	     noteTweenY("noteY6", 5, 70, 6, "cubeInOut")
		 noteTweenY("noteY7", 6, 70, 6, "cubeInOut")
		 noteTweenY("noteY8", 7, 70, 6, "cubeInOut")

        end
    end

    if curStep == 688 then

        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

         setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', true)

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         setPropertyFromGroup('playerStrums', 0, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', false)
        end
    end

    if curStep == 848 then

        doTweenY('opponentmoveYdown', 'dadGroup', -230, 2)
        doTweenY('bfmoveYup', 'boyfriendGroup', -300, 2)

        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

         noteTweenY("noteY1", 0, 570, 4, "cubeInOut")
         noteTweenY("noteY2", 1, 570, 4, "cubeInOut")
         noteTweenY("noteY3", 2, 570, 4, "cubeInOut")
         noteTweenY("noteY4", 3, 570, 4, "cubeInOut")

         setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
         setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
         setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
         setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         noteTweenY("noteY1", 0, 70, 4, "cubeInOut")
         noteTweenY("noteY2", 1, 70, 4, "cubeInOut")
         noteTweenY("noteY3", 2, 70, 4, "cubeInOut")
         noteTweenY("noteY4", 3, 70, 4, "cubeInOut")

         setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
         setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
         setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
         setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
         
        end
    end

    if curStep == 896 then

        DanceAmt = 1

        followchars = false

     setProperty('defaultCamZoom', 0.75)

     triggerEvent('Camera Follow Pos', 300, yy2)

     triggerEvent('Toggle Trail', 0, 1)

    end

    if curStep == 912 then

     WindowDance2 = false
     DanceAmt = 0.6
     WindowDance = true
     
     setPropertyFromClass('openfl.Lib', 'application.window.y', windowy)
     setPropertyFromClass('openfl.Lib', 'application.window.x', windowx)


     
     followchars = true

     setProperty('flash.alpha',1)
     doTweenAlpha('flTw','flash',0,0.6,'linear')

     setProperty('iconP1.visible', true);
	 setProperty('iconP2.visible', true);
	 setProperty('healthBar.visible', true);
	 setProperty('healthBarBG.visible', true);
     setProperty('scoreTxt.visible', true);

     setProperty('defaultCamZoom', 0.5)

     triggerEvent('Toggle Trail', 0, 0)
     
    end
	if curStep == 1424 then
	     doTweenX('browndeadtween','brd',-2500,25,'linear')
     doTweenAngle('browndeadtweenangle','brd',1080,35,'sineInOut')
	end
	if curStep == 1648 then
	     doTweenX('trtween','tr',-2500,20,'linear')
     doTweenAngle('trtweenangle','tr',1080,35,'sineInOut')
	-- removeLuaSprite('brd', true)
	-- removeLuaSprite('bld', true)
	end
	
	 if curStep == 1680 then
        WindowDance = false
        
        WindowDance2 = true

        followchars = true

        setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
		setProperty('healthBar.visible', false);
		setProperty('healthBarBG.visible', false);
        setProperty('scoreTxt.visible', false);
		
        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

         noteTweenY("noteY5", 4, 70, 6, "cubeInOut")
	     noteTweenY("noteY6", 5, 70, 6, "cubeInOut")
		 noteTweenY("noteY7", 6, 70, 6, "cubeInOut")
		 noteTweenY("noteY8", 7, 70, 6, "cubeInOut")

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         noteTweenY("noteY5", 4, 570, 6, "cubeInOut")
	     noteTweenY("noteY6", 5, 570, 6, "cubeInOut")
		 noteTweenY("noteY7", 6, 570, 6, "cubeInOut")
		 noteTweenY("noteY8", 7, 570, 6, "cubeInOut")

        end
    end

    if curStep == 1696 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
            
         setPropertyFromGroup('playerStrums', 0, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', false)

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
            
            setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
            setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
            setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
            setPropertyFromGroup('playerStrums', 3, 'downScroll', true)

        end
    end
    

    if curStep == 1854 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
         noteTweenY("noteY5", 4, 570, 3, "cubeInOut")
	     noteTweenY("noteY6", 5, 570, 3, "cubeInOut")
		 noteTweenY("noteY7", 6, 570, 3, "cubeInOut")
		 noteTweenY("noteY8", 7, 570, 3, "cubeInOut")

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
         noteTweenY("noteY5", 4, 70, 3, "cubeInOut")
	     noteTweenY("noteY6", 5, 70, 3, "cubeInOut")
		 noteTweenY("noteY7", 6, 70, 3, "cubeInOut")
		 noteTweenY("noteY8", 7, 70, 3, "cubeInOut")

        end
    end

if curStep == 1872 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then

         setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', true)

        elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then

         setPropertyFromGroup('playerStrums', 0, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 1, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 2, 'downScroll', false)
         setPropertyFromGroup('playerStrums', 3, 'downScroll', false)
        end
		
		setProperty('iconP1.visible', true);
		setProperty('iconP2.visible', true);
		setProperty('healthBar.visible', true);
		setProperty('healthBarBG.visible', true);
        setProperty('scoreTxt.visible', true);
end
	
				if curStep == 1936 then
	     doTweenX('trtween','ship',-7000,0.7,'expoOut')
doTweenX('dadf','boyfriend',-700,0.7,'expoOut')
doTweenX('bff','dad',-2000,0.7,'expoOut')

	end
	
					if curStep == 1942 then
doTweenX('dadf','boyfriend',250,3,'sineIn')
doTweenX('bff','dad',-1400,3,'sineIn')
	end
		if curStep == 2192 then
setProperty('pb.visible', true)
--removeLuaSprite('tr', true)
--removeLuaSprite('ship', true)
	end

end

function onCreatePost()

	initLuaShader("bloom")

	if shadersEnabled == true then
		makeLuaSprite("shaderImage")
		makeGraphic("shaderImage", screenWidth, screenHeight)
	end
	
	setSpriteShader("shaderImage", "bloom")

    addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
	trace(ShaderFilter);
	game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	]])


setProperty('gf.visible', false)

doTweenY('speedlinesmoveup','sl',-2900,0.4,'linear')
doTweenY('cloudsmoveup','cf',-3600,220,'sineInOut')
doTweenY('skymoveup','bg',-5500,280,'sineInOut')
doTweenY('planetmoveup','pb',-2500,380,'sineInOut')

doTweenY('scrollclouds','cs',-1200,0.4,'sineInOut')
doTweenY('scrollclouds2','cs2',-3600,0.6,'sineInOut')
doTweenAngle('bfbro','boyfriendGroup',360,20,'sineInOut')
end

function onBeatHit()

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

if tag == 'cloudsstop' then
doTweenY('scrollclouds','cs',-1200,0.4,'sineInOut')
end

if tag == 'cloudsstop2' then
doTweenY('scrollclouds2','cs2',-3600,0.55,'sineInOut')
end
end

function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag
	
	if tag == 'scrollclouds' then
	setProperty('cs.y', 1200)
	
	local luckyRoll = math.random(1, 2)
    local luckyRoll2 = math.random(1, 2)
    
 
        if (luckyRoll >= 1) then
            setProperty('cs.flipX', true)
			runTimer('cloudsstop', 1, 1)
        end
        if (luckyRoll2 >= 2) then
             setProperty('cs.flipX', false)
			 doTweenY('scrollclouds','cs',-1200,0.45,'sineInOut')
			
        end
    
	

	end
	
	if tag == 'scrollclouds2' then
	setProperty('cs2.y', 0)
	
	local luckyRoll = math.random(1, 2)
    local luckyRoll2 = math.random(1, 2)
    
 
        if (luckyRoll >= 1) then
            setProperty('cs2.flipX', true)
			runTimer('cloudsstop2', 1, 1)
        end
        if (luckyRoll2 >= 2) then
             setProperty('cs2.flipX', false)
		doTweenY('scrollclouds2','cs2',-3600,0.5,'sineInOut')
			
        end
    

	end
	
	if tag == 'speedlinesmoveup' then
	setProperty('sl.y', 100)
	
	local luckyRoll = math.random(1, 2)
    local luckyRoll2 = math.random(1, 2)
    
 
        if (luckyRoll >= 1) then
            setProperty('sl.flipX', true)
        end
        if (luckyRoll2 >= 2) then
             setProperty('sl.flipX', false)
        end
    
	
	doTweenY('speedlinesmoveup','sl',-2900,0.4,'linear')
	end
	
		if tag == 'bfbro' then
doTweenAngle('bfbro2','boyfriendGroup',0,20,'sineInOut')
	end
	
			if tag == 'bfbro2' then
doTweenAngle('bfbro','boyfriendGroup',360,20,'sineInOut')
	end
end

function onSongStart()


callScript('scripts/videoSprite', 'makeVideoSprite', {'skyfall', 'skyfall', 0, 0, 'other'})

setPropertyFromClass('openfl.Lib', 'application.window.borderless',true)

end

function onPause()
    setPropertyFromClass('openfl.Lib', 'application.window.borderless',false)
end

function onResume()
    setPropertyFromClass('openfl.Lib', 'application.window.borderless',true)
end

function onEndSong()
    setPropertyFromClass('openfl.Lib', 'application.window.y', windowy)
    setPropertyFromClass('openfl.Lib', 'application.window.x', windowx)
    setPropertyFromClass('openfl.Lib', 'application.window.borderless',false)
end

function onDestroy()
    setPropertyFromClass('openfl.Lib', 'application.window.y', windowy)
    setPropertyFromClass('openfl.Lib', 'application.window.x', windowx)
    setPropertyFromClass('openfl.Lib', 'application.window.borderless',false)
end

function onUpdatePost(elapsed)

    SineElap = SineElap + (elapsed * DanceAmt)

    if WindowDance == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(SineElap)/20+windowy)
    end

    if WindowDance2 == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(SineElap)/13+windowy)
        setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(SineElap)/8+windowx)
    end
end

function onUpdate(e, elapsed) -- The Main Code

    setProperty('camHUD.angle',0.3 *math.sin(getSongPosition()/550) * math.pi)
    setProperty('camHUD.y',3 *math.sin(getSongPosition()/350))
    setProperty('camHUD.x',3 *math.sin(getSongPosition()/220))
	


  luaDebugMode = true
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
  if not mustHitSection then
    runHaxeCode 'game.moveCameraSection();'
  end
  

setProperty('boyfriendGroup.x', getProperty 'boyfriendGroup.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
  setProperty('boyfriendGroup.y', getProperty 'boyfriendGroup.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)
  if not mustHitSection then
    runHaxeCode 'game.moveCameraSection();'
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



















