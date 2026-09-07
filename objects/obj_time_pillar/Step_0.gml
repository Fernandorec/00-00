timer -= 1;

if (timer <= 0 && !triggered) {
    triggered = true;

    // --- Verifica si Zero está dentro del pilar al activarse ---
    if (instance_exists(obj_player)) {
        var _px = obj_player.x;
        if (_px > x - pillar_width/2 && _px < x + pillar_width/2) {
            obj_player.frozen = true; // reutilizamos el freeze, o puedes cambiar esto por daño
            obj_player.freeze_timer = 1 * room_speed;
        }
    }

    alarm[0] = active_time; // tiempo que se queda visualmente activo antes de desaparecer
}