function onSongStart()

  callScript('scripts/videoSprite', 'makeVideoSprite', {'eludeCut', 'eludeCut', 0, 0, 'other'})
end

function onCreate()

    setProperty('skipCountdown', true)
	end