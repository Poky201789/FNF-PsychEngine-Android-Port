local DadX = 380
local DadY = 430

local BfX = 450
local BfY = 430



local GfX = 0
local GfY = 0

local BfOfs = 30
local GfOfs = 30
local DadOfs = 30

local BfOfsX = 0
local BfOfsY = 0

local GfOfsX = 0
local GfOfsY = 0

local DadOfsX = 0
local DadOfsY = 0

local enableSystem = true
local cameraFollowing = true

local currentTarget = ''
local currentSection = nil
local firstSection = false

--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--
function onBeatHit()
    if curBeat % 4 == 0 and currentSection == nil then
        currentSection = ''
    end
end

function onUpdate()

--events
if curStep == 1 then
end
--events

    if enableSystem == true and getProperty('isCameraOnForcedPos') == false then
        if currentSection ~= nil then
            if gfSection ~= true then
                if mustHitSection == false  then
                    if currentSection ~= 'dad' then
                        currentTarget = 'dad'
                        currentSection = 'dad'
                    end
                else
                    if currentSection ~= 'boyfriend' then
                        currentTarget = 'boyfriend'
                        currentSection = 'boyfriend'
                    end
                end
            else
                if currentSection ~= 'gf' then
                    currentTarget = 'gf'
                    currentSection = 'gf'
                end
            end
        end
        if currentTarget == 'boyfriend' then
         --   BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]') + BfOfsX
         --  BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]') + BfOfsY
    
            if string.find(getProperty('boyfriend.animation.curAnim.name'),'singLEFT',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',BfX-BfOfs,BfY)
				doTweenAngle('angleRight', 'camGame', -0.4, 0.4, 'expoOut')
                cameraFollowing = true
    
            elseif string.find(getProperty('boyfriend.animation.curAnim.name'),'singDOWN',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',BfX,BfY+BfOfs)
				doTweenAngle('angleRight', 'camGame', 0, 0.4, 'expoOut')
				
                cameraFollowing = true
    
            elseif string.find(getProperty('boyfriend.animation.curAnim.name'),'singRIGHT',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',BfX+BfOfs,BfY)
				doTweenAngle('angleRight', 'camGame', 0.4, 0.4, 'expoOut')
                cameraFollowing = true
    
            elseif string.find(getProperty('boyfriend.animation.curAnim.name'),'singUP',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',BfX,BfY-BfOfs)
				doTweenAngle('angleRight', 'camGame', 0, 0.4, 'expoOut')
                cameraFollowing = true
			 elseif string.find(getProperty('boyfriend.animation.curAnim.name'),'idle',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',BfX,BfY)
				doTweenAngle('angleRight', 'camGame', 0, 0.4, 'expoOut')
                cameraFollowing = true

            end
    
        elseif currentTarget == 'dad' then
         --   DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]') + DadOfsX
         --   DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]') + DadOfsY
    
            if string.find(getProperty('dad.animation.curAnim.name'),'singLEFT',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',DadX-DadOfs,DadY)
				doTweenAngle('angleRight', 'camGame', -0.4, 0.4, 'expoOut')
                cameraFollowing = true
    
            elseif string.find(getProperty('dad.animation.curAnim.name'),'singDOWN',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',DadX,DadY+DadOfs)
				doTweenAngle('angleRight', 'camGame', 0, 0.4, 'expoOut')
                cameraFollowing = true
    
            elseif string.find(getProperty('dad.animation.curAnim.name'),'singUP',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',DadX,DadY-DadOfs)
				doTweenAngle('angleRight', 'camGame', 0, 0.4, 'expoOut')
                cameraFollowing = true
    
            elseif string.find(getProperty('dad.animation.curAnim.name'),'singRIGHT',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',DadX+DadOfs,DadY)
				doTweenAngle('angleRight', 'camGame', 0.4, 0.4, 'expoOut')
                cameraFollowing = true
    
	            elseif string.find(getProperty('dad.animation.curAnim.name'),'idle',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',DadX,DadY)
				doTweenAngle('angleRight', 'camGame', 0, 0.4, 'expoOut')
                cameraFollowing = true

            end
        elseif currentTarget == 'gf' then
            GfX = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]') + GfOfsX
            GfY = getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]') + GfOfsY
            if string.find(getProperty('gf.animation.curAnim.name'),'singLEFT',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',GfX-GfOfs,GfY)
                cameraFollowing = true
    
            elseif string.find(getProperty('gf.animation.curAnim.name'),'singDOWN',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',GfX,GfY + GfOfs)
                cameraFollowing = true
    
            elseif string.find(getProperty('gf.animation.curAnim.name'),'singUP',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',GfX,GfY - GfOfs)
                cameraFollowing = true
    
            elseif string.find(getProperty('gf.animation.curAnim.name'),'singRIGHT',0,true) ~= nil then
                triggerEvent('Camera Follow Pos',GfX+GfOfs,GfY)
                cameraFollowing = true
    
            else
                if cameraFollowing == true then
                    triggerEvent('Camera Follow Pos',GfX,GfY)
                    triggerEvent('Camera Follow Pos','','')
                    cameraFollowing = false
                end
            end
        end
        setProperty('isCameraOnForcedPos',false)
    else
        if cameraFollowing == true then
            cameraFollowing = false
        end
    end
end
function onMoveCamera(focus)
    if firstSection == false then
        currentTarget = focus
        firstSection = true
    end
end