-- script by GamingFan3926 on GameBanana
function onEvent(eventName, value1, value2)
    if eventName == "Arrow Overlap" then
        if value1 == "left" then
            noteTweenAlpha('NoteAlpha1L', 0, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha2L', 1, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha3L', 2, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha4L', 3, 0.5, 0.1, cubeInOut)
            noteTweenX("NoteMove1L", 0, 92, 0.1, cubeInOut)
            noteTweenX("NoteMove2L", 1, 204, 0.1, cubeInOut)
            noteTweenX("NoteMove3L", 2, 316, 0.1, cubeInOut)
            noteTweenX("NoteMove4L", 3, 428, 0.1, cubeInOut)
            noteTweenX("NoteMove5L", 4, 92, 0.1, cubeInOut)
            noteTweenX("NoteMove6L", 5, 204, 0.1, cubeInOut)
            noteTweenX("NoteMove7L", 6, 316, 0.1, cubeInOut)
            noteTweenX("NoteMove8L", 7, 428, 0.1, cubeInOut)
        elseif value1 == "middle" then
            noteTweenAlpha('NoteAlpha1L', 0, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha2L', 1, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha3L', 2, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha4L', 3, 0.5, 0.1, cubeInOut)
            noteTweenX("NoteMove1M", 0, 412, 0.1, cubeInOut)
            noteTweenX("NoteMove2M", 1, 524, 0.1, cubeInOut)
            noteTweenX("NoteMove3M", 2, 636, 0.1, cubeInOut)
            noteTweenX("NoteMove4M", 3, 748, 0.1, cubeInOut)
            noteTweenX("NoteMove5M", 4, 412, 0.1, cubeInOut)
            noteTweenX("NoteMove6M", 5, 524, 0.1, cubeInOut)
            noteTweenX("NoteMove7M", 6, 636, 0.1, cubeInOut)
            noteTweenX("NoteMove8M", 7, 748, 0.1, cubeInOut)
        elseif value1 == "right" then
            noteTweenAlpha('NoteAlpha1L', 0, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha2L', 1, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha3L', 2, 0.5, 0.1, cubeInOut)
            noteTweenAlpha('NoteAlpha4L', 3, 0.5, 0.1, cubeInOut)
            noteTweenX("NoteMove1R", 0, 732, 0.1, cubeInOut)
            noteTweenX("NoteMove2R", 1, 844, 0.1, cubeInOut)
            noteTweenX("NoteMove3R", 2, 956, 0.1, cubeInOut)
            noteTweenX("NoteMove4R", 3, 1068, 0.1, cubeInOut)
            noteTweenX("NoteMove5R", 4, 732, 0.1, cubeInOut)
            noteTweenX("NoteMove6R", 5, 844, 0.1, cubeInOut)
            noteTweenX("NoteMove7R", 6, 956, 0.1, cubeInOut)
            noteTweenX("NoteMove8R", 7, 1068, 0.1, cubeInOut)
        end
        if value1 == "default" then
            noteTweenX("NoteMove1D", 0, defaultOpponentStrumX0, 0.1, cubeInOut)
            noteTweenX("NoteMove2D", 1, defaultOpponentStrumX1, 0.1, cubeInOut)
            noteTweenX("NoteMove3D", 2, defaultOpponentStrumX2, 0.1, cubeInOut)
            noteTweenX("NoteMove4D", 3, defaultOpponentStrumX3, 0.1, cubeInOut)
            noteTweenX("NoteMove5D", 4, defaultPlayerStrumX0, 0.1, cubeInOut)
            noteTweenX("NoteMove6D", 5, defaultPlayerStrumX1, 0.1, cubeInOut)
            noteTweenX("NoteMove7D", 6, defaultPlayerStrumX2, 0.1, cubeInOut)
            noteTweenX("NoteMove8D", 7, defaultPlayerStrumX3, 0.1, cubeInOut)
            noteTweenY("NoteMove1DY", 0, defaultOpponentStrumY0, 0.1, cubeInOut)
            noteTweenY("NoteMove2DY", 1, defaultOpponentStrumY1, 0.1, cubeInOut)
            noteTweenY("NoteMove3DY", 2, defaultOpponentStrumY2, 0.1, cubeInOut)
            noteTweenY("NoteMove4DY", 3, defaultOpponentStrumY3, 0.1, cubeInOut)
            noteTweenY("NoteMove5DY", 4, defaultPlayerStrumY0, 0.1, cubeInOut)
            noteTweenY("NoteMove6DY", 5, defaultPlayerStrumY1, 0.1, cubeInOut)
            noteTweenY("NoteMove7DY", 6, defaultPlayerStrumY2, 0.1, cubeInOut)
            noteTweenY("NoteMove8DY", 7, defaultPlayerStrumY3, 0.1, cubeInOut)
            if downscroll == true then
                setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
            elseif downscroll == false then
                setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
            end
            if middlescroll == false then
                noteTweenAlpha('NoteAlpha1D', 0, 1, 0.1, cubeInOut)
                noteTweenAlpha('NoteAlpha2D', 1, 1, 0.1, cubeInOut)
                noteTweenAlpha('NoteAlpha3D', 2, 1, 0.1, cubeInOut)
                noteTweenAlpha('NoteAlpha4D', 3, 1, 0.1, cubeInOut)
            elseif middlescroll == true then
                noteTweenAlpha('NoteAlpha1DM', 0, 0.5, 0.1, cubeInOut)
                noteTweenAlpha('NoteAlpha2DM', 1, 0.5, 0.1, cubeInOut)
                noteTweenAlpha('NoteAlpha3DM', 2, 0.5, 0.1, cubeInOut)
                noteTweenAlpha('NoteAlpha4DM', 3, 0.5, 0.1, cubeInOut)
            end
        end

        if value2 == "yes" then
            if value1 == "default" then
                setHealth(getHealth);
            else
            if downscroll == true then
                noteTweenY("NoteMoveAlt1", 0, 50, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt2", 1, 50, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt3", 2, 50, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt4", 3, 50, 0.1, cubeInOut)
                setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
            elseif downscroll == false then
                noteTweenY("NoteMoveAlt5", 0, 570, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt6", 1, 570, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt7", 2, 570, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt8", 3, 570, 0.1, cubeInOut)
                setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
            end
            end
        elseif value2 == "no" or value2 == "" then
            if value1 == "default" then
                setHealth(getHealth());
            else
            if downscroll == true then
                noteTweenY("NoteMoveAlt1", 0, 570, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt2", 1, 570, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt3", 2, 570, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt4", 3, 570, 0.1, cubeInOut)
                setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
            elseif downscroll == false then
                noteTweenY("NoteMoveAlt5", 0, 50, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt6", 1, 50, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt7", 2, 50, 0.1, cubeInOut)
                noteTweenY("NoteMoveAlt8", 3, 50, 0.1, cubeInOut)
                setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
            end
            end
        end
    end
end