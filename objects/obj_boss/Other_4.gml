// --- Música de batalla en loop ---
if (!audio_is_playing(snd_boss_theme)) {
    music_id = audio_play_sound(snd_boss_theme, 1, true);
}