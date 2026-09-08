// --- Música de fondo según la sala ---
if (room == rm_boss) {
    if (!audio_is_playing(snd_level_theme)) {
        audio_play_sound(snd_level_theme, 1, true); // true = loop
    }
}