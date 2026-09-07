if (instance_exists(obj_player)) {
    var _center_x = obj_player.x;

    // Calcula el punto de inicio para que el conjunto quede centrado en Zero
    var _start_x = _center_x - ((pillar_count - 1) * pillar_spread) / 2;

    for (var i = 0; i < pillar_count; i++) {
        var _px = _start_x + (i * pillar_spread);

        // Mantiene el pilar dentro de los límites de la arena
        _px = clamp(_px, arena_left + 30, arena_right - 30);

        var _pillar = instance_create_layer(_px, arena_top, "Instances", obj_time_pillar);
        _pillar.top_y = arena_top;
        _pillar.bottom_y = arena_bottom;
    }
}

alarm[9] = 10 * room_speed;