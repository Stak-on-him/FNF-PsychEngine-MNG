function onCreatePost()

    addHaxeLibrary('Main');
    addHaxeLibrary('TextFormat','openfl.text');
    runHaxeCode([[
    Main.fpsVar.defaultTextFormat = new TextFormat("_sans", 12, 0xFFFFFF);
]]);

end

function onDestroy()

addHaxeLibrary('Main');
    addHaxeLibrary('TextFormat','openfl.text');
    runHaxeCode([[
    Main.fpsVar.defaultTextFormat = new TextFormat("_sans", 12, 0xFFFFFF);
]]);
end
