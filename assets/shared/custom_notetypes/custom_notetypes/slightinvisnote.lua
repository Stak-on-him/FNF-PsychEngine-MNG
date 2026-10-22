function onCreate() -- the game decided to be fucky and not change note colors so i gotta do this now FUCK

for i = 0, getProperty('unspawnNotes.length')-1 do

if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'slightinvisnote' then -- try name in file in same name (in lua)

    setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0.25);
    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true);
end
end
end