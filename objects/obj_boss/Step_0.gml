switch (boss_state) {

    case "fly":
        // --- Movimiento horizontal constante ---
        hsp = h_dir * move_spd;

        // --- Movimiento vertical: onda senoidal ---
        wave_offset += wave_frequency;
        var _target_y = base_y + sin(wave_offset) * wave_amplitude;
        vsp = (_target_y - y) * 0.1;

        // --- Colisión horizontal (rebota en los bordes) ---
        if (place_meeting(x + hsp, y, obj_solid)) {
            while (!place_meeting(x + sign(hsp), y, obj_solid)) {
                x += sign(hsp);
            }
            h_dir = -h_dir;
            face = h_dir;
            hsp = h_dir * move_spd;
        }
        x += hsp;

        // --- Colisión vertical ---
        if (place_meeting(x, y + vsp, obj_solid)) {
            while (!place_meeting(x, y + sign(vsp), obj_solid)) {
                y += sign(vsp);
            }
            vsp = 0;
            base_y = y;
        }
        y += vsp;
        break;

    case "telegraph":
        hsp = h_dir * move_spd;
        wave_offset += wave_frequency;
        var _target_y2 = base_y + sin(wave_offset) * wave_amplitude;
        vsp = (_target_y2 - y) * 0.1;

        if (place_meeting(x + hsp, y, obj_solid)) {
            while (!place_meeting(x + sign(hsp), y, obj_solid)) {
                x += sign(hsp);
            }
            h_dir = -h_dir;
            face = h_dir;
            hsp = h_dir * move_spd;
        }
        x += hsp;

        if (place_meeting(x, y + vsp, obj_solid)) {
            while (!place_meeting(x, y + sign(vsp), obj_solid)) {
                y += sign(vsp);
            }
            vsp = 0;
            base_y = y;
        }
        y += vsp;

        if (instance_exists(obj_player)) {
            telegraph_target_x = obj_player.x;
            telegraph_target_y = obj_player.y;
        }

        if (telegraph_target_x < x) {
            face = -1;
        } else {
            face = 1;
        }
        break;

    case "dash":
        var _dir_x = telegraph_target_x - x;
        var _dir_y = telegraph_target_y - y;
        var _dist = point_distance(x, y, telegraph_target_x, telegraph_target_y);

        if (_dist > dash_spd) {
            hsp = (_dir_x / _dist) * dash_spd;
            vsp = (_dir_y / _dist) * dash_spd;
        } else {
            hsp = 0;
            vsp = 0;
            boss_state = "return";
        }

        var _hit_wall = false;

        if (place_meeting(x + hsp, y, obj_solid)) {
            while (!place_meeting(x + sign(hsp), y, obj_solid)) {
                x += sign(hsp);
            }
            hsp = 0;
            _hit_wall = true;
        }
        x += hsp;

        if (place_meeting(x, y + vsp, obj_solid)) {
            while (!place_meeting(x, y + sign(vsp), obj_solid)) {
                y += sign(vsp);
            }
            vsp = 0;
            _hit_wall = true;
        }
        y += vsp;

        if (_hit_wall) {
            boss_state = "return";
        }
        break;

    case "silhouette":
        hsp = 0;
        vsp = 0;
        break;

    case "sweep":
        sweep_time_left -= 1;

        hsp = sweep_dir * sweep_spd;
        vsp = (sweep_fixed_y - y) * 0.1;

        if (place_meeting(x + hsp, y, obj_solid)) {
            while (!place_meeting(x + sign(hsp), y, obj_solid)) {
                x += sign(hsp);
            }
            sweep_dir = -sweep_dir;
            face = sweep_dir;
            hsp = sweep_dir * sweep_spd;
        }
        x += hsp;

        if (place_meeting(x, y + vsp, obj_solid)) {
            vsp = 0;
        }
        y += vsp;

        if (sweep_time_left <= 0) {
            boss_state = "return";
        }
        break;

    case "shoot":
        hsp = 0;
        vsp = 0;

        shoot_time_left -= 1;

        if (instance_exists(obj_player)) {
            face = (obj_player.x < x) ? -1 : 1;
        }

        if (shoot_time_left <= 0) {
            boss_state = "return";
            alarm[8] = -1;
        }
        break;

    case "return":
        var _dist_home = point_distance(x, y, origin_x, origin_y);

        if (_dist_home > return_spd) {
            var _dir_hx = origin_x - x;
            var _dir_hy = origin_y - y;
            hsp = (_dir_hx / _dist_home) * return_spd;
            vsp = (_dir_hy / _dist_home) * return_spd;
            x += hsp;
            y += vsp;
        } else {
            x = origin_x;
            y = origin_y;
            base_y = y;
            wave_offset = 0;
            boss_state = "fly";

            if (active_attack == "dash") {
                alarm[0] = 5 * room_speed;
            }

            active_attack = "none";
        }
        break;
}

// --- Sacudida al volar (se aplica siempre, en cualquier estado) ---
shake_timer -= 1;
if (shake_timer <= 0) {
    shake_x = random_range(-shake_amount, shake_amount);
    shake_y = random_range(-shake_amount, shake_amount);
    shake_timer = shake_timer_max;
}

// --- Redondear posición base ---
x = round(x);
y = round(y);

// --- Flip del sprite ---
image_xscale = -face;

// --- Rotación compartida de los rayos ---
lightning_rotation += lightning_rotation_speed;

