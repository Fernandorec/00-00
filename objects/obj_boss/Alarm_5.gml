if (boss_state == "silhouette") {
    x = sweep_target_x;
    y = sweep_target_y - sweep_y_offset;

    var _tries = 0;
    var _step = 4;

    while (place_meeting(x, y, obj_solid) && _tries < 20) {
        y -= _step;
        _tries += 1;
    }

    _tries = 0;
    while (place_meeting(x, y, obj_solid) && _tries < 20) {
        x += (h_dir != 0 ? -h_dir : 1) * _step;
        _tries += 1;
    }

    // --- Clamp final: nunca dejar que salga de los límites reales de la arena ---
    x = clamp(x, arena_left, arena_right);
    y = clamp(y, arena_top, arena_bottom);

    // Si después del clamp sigue en un sólido, fuerza volver a la posición de origen
    if (place_meeting(x, y, obj_solid)) {
        x = origin_x;
        y = origin_y;
    }

    if (instance_exists(silhouette_id)) {
        instance_destroy(silhouette_id);
    }

    boss_state = "sweep";
    sweep_time_left = sweep_duration;
    sweep_dir = choose(-1, 1);
    face = sweep_dir;
    sweep_fixed_y = y;
}