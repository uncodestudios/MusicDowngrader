-- File: MusicDowngrader.lua
-- Author: Nyx
-- Date: 07/08/2025:12:24 PM

local canRun = false
local audioSource = nil
local favClip = nil

function Start()
    EObject:LoadAudio("Sounds/bad_tag_xmas.wav", "onAudioLoaded", "MusicDowngrader")
end

function onAudioLoaded(audioClip)
    if not audioClip then
        Debug:LogError("Failed to load audioclip")
        return
    end

    local obj = Engine:FindGameObject("MusicSourceF")
    
    if not obj then
       return
    end

    audioSource = Engine:GetEngineComponent(obj, "AudioSource")

    if not audioSource then
       return
    end

    audioSource.Stop()
    favClip = audioClip
    audioSource.clip = audioClip
    audioSource.Play()
end

function OnUnloaded()
    canRun = false
    favClip = nil
    audioSource = nil
end
