// --- Input ---
var _left  = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump  = keyboard_check_pressed(ord("J"));
var _dash  = keyboard_check_pressed(ord("X"));

var _move = _right - _left;

// --- Movimiento horizontal normal ---
if (estado != "dash") {
    hsp = _move * move_spd;
    if (_move != 0) face = _move;
}

// --- Salto (usa on_ground calculado al FINAL del frame anterior) ---
if (_jump && on_ground && estado != "dash") {
    vsp = jump_spd;
    on_ground = false; // para que este mismo frame ya no cuente como suelo
}

// --- Gravedad ---
if (estado != "dash") {
    if (on_ground) {
        vsp = 0;
    } else {
        vsp += grav;
        if (vsp > 10) vsp = 10; // velocidad máxima de caída
    }
}

// --- Dash ---
if (_dash && dash_cooldown <= 0 && estado != "dash") {
    estado = "dash";
    dash_time = dash_time_max;
    hsp = face * dash_spd;
    vsp = 0;
}

if (estado == "dash") {
    dash_time -= 1;
    if (dash_time <= 0) {
        estado = "idle";
        dash_cooldown = dash_cooldown_max;
    }
}

if (dash_cooldown > 0) dash_cooldown -= 1;

// --- Colisión horizontal ---
if (place_meeting(x + hsp, y, obj_solid)) {
    while (!place_meeting(x + sign(hsp), y, obj_solid)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// --- Colisión vertical ---
if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// --- Redondear posición para evitar temblor visual ---
x = round(x);
y = round(y);

// --- Calcular on_ground UNA SOLA VEZ, con la posición final, para el PRÓXIMO frame ---
on_ground = place_meeting(x, y+1, obj_solid);

// --- Actualizar estado (si no está en dash) ---
if (estado != "dash") {
    if (!on_ground) {
        estado = (vsp < 0) ? "jump" : "fall";
    } else if (hsp != 0) {
        estado = "run";
    } else {
        estado = "idle";
    }
}

// --- Flip del sprite según dirección ---
image_xscale = -face;

// --- Cambiar sprite según el estado ---
var _sprite_anterior = sprite_index;

switch (estado) {
    case "idle":
        sprite_index = spr_zero_idle;
        break;
    case "run":
        sprite_index = spr_zero_run;
        break;
    case "jump":
        sprite_index = spr_zero_jump;
        break;
    case "fall":
        sprite_index = spr_zero_fall;
        break;
    case "dash":
        sprite_index = spr_zero_run; // reemplaza por spr_zero_dash cuando lo tengas
        break;
}

// Si el sprite cambió, reinicia la animación desde el frame 0
if (sprite_index != _sprite_anterior) {
    image_index = 0;
}