local cameraName = "cameraYoThere"
local shaderName = "shaderYoThere"

function onEvent(name, value1, value2)
    if name == 'Set Camera Shader' then
        --set name
        cameraName = value1
        shaderName = value2

        -- if empty to clean
        if value1 == '' and value2 == '' then
            runHaxeCode("game.camGame.setFilters([]);") -- Game
            runHaxeCode("game.camHUD.setFilters([]);") -- HUD and Other

            runHaxeCode([[
                FlxG.game.setFilters([]);
            ]])

        -- or...
        elseif cameraName == 'camGame' or cameraName == 'camgame' or cameraName == 'game' then
            shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

            makeLuaSprite("tempShader0")

            runHaxeCode([[
                var shaderName = "]] .. shaderName .. [[";
                
                game.initLuaShader(shaderName);
                
                var shader0 = game.createRuntimeShader(shaderName);
                game.camGame.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
                return;
            ]])
        elseif cameraName == 'camHUD' or cameraName == 'camhud' or cameraName == 'hud' then
            shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

            makeLuaSprite("tempShader0")

            runHaxeCode([[
                var shaderName = "]] .. shaderName .. [[";
                
                game.initLuaShader(shaderName);
                
                var shader0 = game.createRuntimeShader(shaderName);
                game.camHUD.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
                return;
            ]])
        elseif cameraName == 'camOther' or cameraName == 'camother' or cameraName == 'other'then
            shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

            makeLuaSprite("tempShader0")

            runHaxeCode([[
                var shaderName = "]] .. shaderName .. [[";
                
                game.initLuaShader(shaderName);
                
                var shader0 = game.createRuntimeShader(shaderName);
                game.camOther.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
                return;
            ]])
        end
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end