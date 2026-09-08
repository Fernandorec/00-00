if (!started) {
    delay_time -= 1;
    if (delay_time <= 0) {
        started = true;
    }
} else {
    edge_x += advance_spd;
}

// --- Detecta si alcanzó a Zero ---
if (started && instance_exists(obj_player)) {
    if (obj_player.x <= edge_x) {
        obj_player.hp = 0;
        room_restart();
    }
}