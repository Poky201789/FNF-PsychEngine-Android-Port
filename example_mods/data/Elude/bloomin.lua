function setCamFilter(cam, shader)
    if shadersEnabled then
        initLuaShader(shader)
        if not luaSpriteExists('shaderImage2') then
            makeLuaSprite('shaderImage2')
            makeGraphic('shaderImage2', screenWidth, screenHeight)
            setSpriteShader('shaderImage2', shader)
        end
        runHaxeCode('game.'..cam..'.setFilters([new ShaderFilter(game.getLuaObject("shaderImage2").shader)]);')
        if luaDebugMode then
            debugPrint('setCamFilter : Shader successfully added to the camera "'..cam..'"')
        end
    end
end
    
function removeCamFilter(cam)
    if shadersEnabled then
        if luaSpriteExists('shaderImage2') then
            removeLuaSprite('shaderImage2')
        end
        runHaxeCode('game.'..cam..'.setFilters(null);')	
        if luaDebugMode then
            debugPrint('removeCamFilter : Shader successfully removed from the camera "'..cam..'"')
        end
    end
end
    
function onCreate()
    setCamFilter('camGame', 'bloom')
end

function onUpdatePost(elapsed)
    setShaderFloat("shaderImage2", "iTime", os.clock())
end
    
function onUpdate()



end