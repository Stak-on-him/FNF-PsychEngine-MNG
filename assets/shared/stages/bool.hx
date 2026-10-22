boolShader = nil
defaultBG = nil

function onCreate()
    -- Create the shader
    boolShader = createRuntimeShader('bool')

    -- Get default background
    defaultBG = getVar('defaultBG')

    -- Initialize shader uniforms
    setShaderFloat(boolShader, 'u_distort', 0)
    setShaderFloatArray(boolShader, 'u_scale', {1, 1})
    setShaderFloatArray(boolShader, 'u_offset', {1, 1})
    setShaderFloat(boolShader, 'u_time', 0)
    setShaderFloat(boolShader, 'u_mix', 0.6)

    -- Set background scroll factor
    setProperty('defaultBG.bg.scrollFactor.x', 0.6)
    setProperty('defaultBG.bg.scrollFactor.y', 0.6)

    -- Apply shader to background
    setSpriteShader('defaultBG.bg', boolShader)
end

function onUpdatePost(elapsed)
    -- Get previous mix value
    local prevMix = getShaderFloat(boolShader, 'u_mix')

    -- Lerp towards 0.3 smoothly
    local newMix = lerp(prevMix, 0.3, getElapsedLerp(0.2, elapsed))

    -- Update shader uniform
    setShaderFloat(boolShader, 'u_mix', newMix)
end

function onBeatHit()
    -- Increment mix and time
    local currentMix = getShaderFloat(boolShader, 'u_mix')
    setShaderFloat(boolShader, 'u_mix', currentMix + 0.2)

    local currentTime = getShaderFloat(boolShader, 'u_time')
    setShaderFloat(boolShader, 'u_time', currentTime + 1)
end

-- Helper functions
function lerp(a, b, t)
    return a + (b - a) * t
end

function getElapsedLerp(speed, elapsed)
    return math.min(1, speed * elapsed)
end
