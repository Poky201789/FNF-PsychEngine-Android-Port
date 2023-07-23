eT = 0 --elapsed time
reach = {
  x = 0.5,
  y = 0.1
}
speed = {
  x = 3,
  y = 2
}
offset = {
  x = 0,
  y = 0
}


bfreach = {
  x = -0.5,
  y = -0.1
}
bfspeed = {
  x = 3,
  y = 2
}
bfoffset = {
  x = 3,
  y = 0
}

IntroTextSize = 20
IntroSubTextSize = 20
IntroTagColor = 'ffffff'
IntroTagWidth = 15
Name = 'Elude'
Author = 'Astru'

local speedbg = 2

local skipped = false

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

makeLuaText('Skip', 'Press SPACE to skip intro.', 1500, -110, 500)
setTextSize('Skip', 50)
addLuaText('Skip')
setProperty('Skip.alpha', 0.5)
setObjectCamera('Skip', 'other')
  
initLuaShader("scroll")
initLuaShader("blur")
makeLuaSprite('s', 'eludeing/sky', -900, -300);
addLuaSprite('s', false);

makeLuaSprite('sun', 'eludeing/sun', -830, -300);
addLuaSprite('sun', false);



makeLuaSprite('c', 'eludeing/clouds', -950, -300);
scaleObject('c', 1.1, 1)
addLuaSprite('c', false);

makeLuaSprite('wB', 'eludeing/waveB', -1000, 880);
addLuaSprite('wB', false);

makeLuaSprite('wF', 'eludeing/waveF', -900, 940);
addLuaSprite('wF', true);

makeAnimatedLuaSprite('plB', 'eludeing/platform', 0, 0)
addAnimationByPrefix('plB', 'eludeing/platform', 'pSpin', 24, true)
addLuaSprite('plB', false);

makeAnimatedLuaSprite('plF', 'eludeing/platform', 0, 0)
addAnimationByPrefix('plF', 'eludeing/platform', 'pSpin', 24, true)
addLuaSprite('plF', false);

makeLuaSprite('sL', 'eludeing/speedLines', -950, -500);
addLuaSprite('sL', true)
scaleObject('sL', 2, 1)



setProperty('camGame.alpha', 0)

end

function onCreatePost()
setProperty('gf.visible',false)

setSpriteShader('wF', 'scroll');
setShaderFloat('wF', 'xSpeed', speedbg)

setSpriteShader('wB', 'scroll');
setSpriteShader('wB', 'blur');
setShaderFloat('wB', 'xSpeed', speedbg)

setSpriteShader('c', 'scroll');
setShaderFloat('c', 'xSpeed', speedbg)

setSpriteShader('wB', 'scroll');
setShaderFloat('wB', 'xSpeed', speedbg)

setSpriteShader('sL', 'scroll');
setShaderFloat('sL', 'xSpeed', speedbg)
end

function noteMiss(id, direction, noteType, isSustainNote)
setProperty('dad.x',getProperty('dad.x')+5)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
setProperty('dad.x',getProperty('dad.x')-0.1)

end

function onUpdate(e)

  if not getProperty('startingSong') or not getProperty('endingSong') then
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and skipped == false then
      
      if getPropertyFromClass('Skip.alpha', 0.5) then
        setProperty('Skip.alpha', 0)
      end

			setPropertyFromClass('Conductor', 'songPosition', 51000) 
			setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
			setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
      skipped = true
		end
  end

--events

if curStep == 42 then
  doTweenAlpha('SkipIn','Skip',0,1,'linear')
end

if curStep == 416 then

  skipped = true

  runTimer('JukeBoxWait', 5, 1)

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1920,1080,'ffffff')
	      addLuaSprite('flash', true);
		  setObjectCamera('flash', 'other');
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,0.6,'linear')
		setProperty('eludeCut.alpha', 0)
setProperty('camGame.alpha', 1)

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

if curStep == 1248 then
speedbg = 1
end

if curStep == 1376 then
speedbg = 0.5
doTweenColor('a', 'boyfriend', 'ff0000', 1, 'InOutSine')
doTweenColor('b', 'dad', '11f5cf', 1, 'InOutSine')
doTweenColor('c', 'plB', 'ff0000', 1, 'InOutSine')
doTweenColor('d', 'plF', '11f5cf', 1, 'InOutSine')
doTweenColor('e', 'wF', '000000', 1, 'InOutSine')
doTweenColor('f', 'wB', '000000', 1, 'InOutSine')
doTweenColor('g', 'c', '000000', 1, 'InOutSine')
doTweenColor('h', 's', '000000', 1, 'InOutSine')
doTweenColor('i', 'sL', '000000', 1, 'InOutSine')


end

if curStep == 1584 then
speedbg = 0.3



end

if curStep == 1632 then
speedbg = 0.1



end

if curStep == 1650 then
speedbg = 0.1

doTweenColor('a', 'boyfriend', 'ffffff', 1, 'InOutSine')
doTweenColor('b', 'dad', 'ffffff', 1, 'InOutSine')
doTweenColor('c', 'plB', 'ffffff', 1, 'InOutSine')
doTweenColor('d', 'plF', 'ffffff', 1, 'InOutSine')
doTweenColor('e', 'wF', 'ffffff', 1, 'InOutSine')
doTweenColor('f', 'wB', 'ffffff', 1, 'InOutSine')
doTweenColor('g', 'c', 'ffffff', 1, 'InOutSine')
doTweenColor('h', 's', 'ffffff', 1, 'InOutSine')
doTweenColor('i', 'sL', 'ffffff', 1, 'InOutSine')

end

if curStep == 1712 then
speedbg = 0.6
end

if curStep == 1728 then
speedbg = 1.3
end

if curStep == 1744 then
speedbg = 1.6
end
if curStep == 1760 or curStep == 1808 then
speedbg = 2
end
if curStep == 1776 then
speedbg = 1
end

if curStep == 1936 then
speedbg = 2.5
end

if curStep == 2064 then
speedbg = 5.5
end

if curStep == 2128 then
speedbg = 7
end

if curStep == 2191 then
speedbg = 9
end

if curStep == 2223 then
speedbg = 11
end

if curStep == 2255 then
speedbg = 14
end

if curStep == 2287 then
speedbg = 17
end

if curStep == 2305 then
speedbg = 22
end

if curStep == 2307 then
speedbg = 23
end

if curStep == 2309 then
speedbg = 25
end

if curStep == 2319 then
setProperty('camGame.visible', false)
setProperty('camHUD.visible', false)
end
--events

setShaderFloat('wF', 'xSpeed', speedbg)

setShaderFloat('wB', 'xSpeed', speedbg)

setShaderFloat('c', 'xSpeed', speedbg)

setShaderFloat('wB', 'xSpeed', speedbg)

setShaderFloat('sL', 'xSpeed', speedbg)


setProperty('plB.x',getProperty('boyfriend.x')-45)
setProperty('plB.y',getProperty('boyfriend.y')+300)

setProperty('plF.x',getProperty('dad.x')+300)
setProperty('plF.y',getProperty('dad.y')+525)

setShaderFloat("wF", "iTime", os.clock())
setShaderFloat("wB", "iTime", os.clock())
setShaderFloat("c", "iTime", os.clock())

--spinning cams thing
    --setProperty('camHUD.angle',0.3 *math.sin(getSongPosition()/650) * math.pi)
	if curStep < 2064 then
    setProperty('camHUD.y',3 *math.sin(getSongPosition()/350))
    setProperty('camHUD.x',3 *math.sin(getSongPosition()/420))
	else
    setProperty('camHUD.y',0)
    setProperty('camHUD.x',0)

	end
	
	 songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/200)*(curBpm/200)
setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.1))
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.1))

  luaDebugMode = true
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)

  setProperty('wB.y', getProperty 'wB.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
  setProperty('wF.y', getProperty 'wF.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)
  
setProperty('boyfriendGroup.x', getProperty 'boyfriendGroup.x' + math.sin((eT * bfspeed.x) + bfoffset.x) * bfreach.x)
  setProperty('boyfriendGroup.y', getProperty 'boyfriendGroup.y' + math.cos((eT * bfspeed.y) + bfoffset.y) * bfreach.y)

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