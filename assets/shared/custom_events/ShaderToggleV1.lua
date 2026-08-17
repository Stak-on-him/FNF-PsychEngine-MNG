-- Code made by Drawoon_
-- If you use this, please give credit
function onEvent(eventName, value1, value2)
    -- Check if the event is 'ShaderToggleV1'
    if eventName == 'ShaderToggleV1' then
        local shaderName = value1  -- Shader name passed in value1
        local toggle = value2      -- 'on' or 'off' passed in value2

        if toggle == 'on' then
            applyShader(shaderName)
        elseif toggle == 'off' then
            disableShader(shaderName)
        end
    end
end

function onCreate()
    makeLuaSprite('Shader_Sprite')
    setObjectCamera('Shader_Sprite', 'camGame')
end


function applyShader(shaderName)
    if shadersEnabled then
        -- Initialize and apply the shader based on shaderName
        runHaxeCode([[
            var shaderName = ']] .. shaderName .. [[';
         
            game.initLuaShader(shaderName);
        
            var shader0 = game.createRuntimeShader(shaderName);
            game.camGame.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("Shader_Sprite").shader = shader0;
        ]])
    end
end

function disableShader()
    runHaxeCode([[
        game.camGame.setFilters([]);  -- Remove all shader filters
        game.getLuaObject("Shader_Sprite").shader = null;  -- Remove the shader from the sprite
    ]])
end

function onUpdate(elapsed)
    -- Update the shader parameters dynamically (e.g., time and distortion)
    local time = getSongPosition() / 1000  -- Get song position in seconds
    setShaderFloat('Shader_Sprite', 'iTime', time)  -- Update the shader's time property

    -- Apply distortion based on time
    local distortion = math.sin(time * 2) * 0.2  -- Sinusoidal distortion effect
    setShaderFloat('Shader_Sprite', 'distort', distortion)  -- Apply distortion to the shader
    local time = getSongPosition() / 1000 -- Time in seconds
    local resolution = {getPropertyFromClass('openfl.Lib', 'application.window.width'),
                        getPropertyFromClass('openfl.Lib', 'application.window.height'), 1.0}
    local frame = math.floor(time * 60) -- Approximate frame count
    
    -- Pass shader uniform values
    setShaderFloat('Shader_Sprite', 'iTime', time)
    setShaderFloat('Shader_Sprite', 'iTimeDelta', elapsed)
    setShaderInt('Shader_Sprite', 'iFrame', frame)
    setShaderVec3('Shader_Sprite', 'iResolution', resolution)
    
    -- Optional: Set distortion or other effects
    setShaderFloat('Shader_Sprite', 'distort', math.sin(time * 2) * 0.2)
end