// --- Temporizador de cambio de dirección ---
move_timer -= 1;

center_bias_timer += 1;

if (move_timer <= 0) {
    if (center_bias_timer >= center_bias_after) {
        // --- Sesga la dirección hacia el centro de la sala ---
        var _center_x = room_width / 2;
        var _center_y = room_height / 2;

        move_dir_x = sign(_center_x - x);
        move_dir_y = sign(_center_y - y);

        center_bias_timer = 0; // resetea el contador
    } else {
        // --- Movimiento normal aleatorio ---
        move_dir_x = choose(-1, -1, 0, 1, 1);
        move_dir_y = choose(-1, -1, 0, 1, 1);
    }

    move_timer = irandom_range(move_timer_min, move_timer_max);

    if (move_dir_x != 0) {
        face = move_dir_x;
    }
}

hsp = move_dir_x * move_spd;
vsp = move_dir_y * move_spd;

// --- Colisión horizontal ---
if (place_meeting(x + hsp, y, obj_solid)) {
    while (!place_meeting(x + sign(hsp), y, obj_solid)) {
        x += sign(hsp);
    }
    hsp = 0;

    if (random(1) < wall_pause_chance) {
        move_dir_x = 0;
        move_timer = irandom_range(wall_pause_min, wall_pause_max);
    } else {
        move_dir_x = -move_dir_x; // rebota
        move_timer = 0;
    }
}
x += hsp;

// --- Colisión vertical ---
if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }
    vsp = 0;

    if (random(1) < wall_pause_chance) {
        move_dir_y = 0;
        move_timer = irandom_range(wall_pause_min, wall_pause_max);
    } else {
        move_dir_y = -move_dir_y; // rebota
        move_timer = 0;
    }
}
y += vsp;

// --- Redondear posición ---
x = round(x);
y = round(y);

// --- Flip del sprite ---
image_xscale = -face;