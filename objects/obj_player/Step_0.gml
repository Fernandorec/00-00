// --- Input ---
var _left  = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump  = keyboard_check_pressed(ord("J"));
var _dash  = keyboard_check_pressed(ord("L"));
var _switch_weapon = keyboard_check_pressed(ord("Q"));
var _attack = keyboard_check_pressed(ord("K"));

var _move = _right - _left;

// --- Cambiar de arma (no durante el ataque) ---
if (_switch_weapon && estado != "attack") {
    arma = (arma == "espada") ? "disparo" : "espada";
}

// --- Chequeo de pared (solo en el aire) ---
on_wall = false;
wall_dir = 0;

if (!on_ground) {
    if (place_meeting(x + 1, y, obj_solid)) {
        on_wall = true;
        wall_dir = 1;
    } else if (place_meeting(x - 1, y, obj_solid)) {
        on_wall = true;
        wall_dir = -1;
    }
}

var _wall_sliding = on_wall && !on_ground && vsp >= 0 && (_move == wall_dir);

// --- Ataque (en suelo, aire o pegado a pared) ---
var _can_attack = (estado != "attack" && estado != "dash");
var _cooldown_ok = _wall_sliding || (attack_cooldown <= 0);

if (_attack && _can_attack && _cooldown_ok) {
    attack_time = attack_duration;

    var _atk_dir = _wall_sliding ? -wall_dir : face;

    show_debug_message("wall_sliding: " + string(_wall_sliding) + " | wall_dir: " + string(wall_dir) + " | atk_dir: " + string(_atk_dir)); // DEBUG TEMPORAL

    if (!_wall_sliding) {
        estado = "attack";
    }

    if (arma == "espada") {
        var _sword = instance_create_layer(x + (_atk_dir * 15), y - 15, "Instances", obj_sword);
        _sword.image_xscale = -_atk_dir;
        _sword.lifetime = attack_duration;
        _sword.owner = id;
    } else if (arma == "disparo") {
        var _bullet = instance_create_layer(x + (_atk_dir * 10), y - 20, "Instances", obj_bullet);
        var _bullet_spd = 8;
        _bullet.hspeed = _atk_dir * _bullet_spd;
        _bullet.image_xscale = -_atk_dir;
    }

    if (!_wall_sliding) {
        attack_cooldown = attack_cooldown_max;
    }
}

if (estado == "attack") {
    attack_time -= 1;
    if (attack_time <= 0) {
        estado = "idle";
    }
}

if (attack_cooldown > 0) attack_cooldown -= 1;

// --- Salto ---
var _dash_jump = false;

if (_jump && on_ground && estado != "attack") {
    vsp = jump_spd;
    on_ground = false;

    if (estado == "dash") {
        estado = "jump";
        dash_cooldown = dash_cooldown_max;
        _dash_jump = true;

        if (_move == face) {
            hsp = face * dash_spd * dash_jump_boost;
        } else {
            hsp = face * dash_spd;
        }
    }
} else if (_jump && _wall_sliding) {
    vsp = wall_jump_vsp;
    hsp = -wall_dir * wall_jump_hsp;
    face = -wall_dir;
    estado = "jump";
    _dash_jump = true;
    wall_jump_lock = wall_jump_lock_max;
    _wall_sliding = false;
}

// --- Movimiento horizontal normal ---
if (wall_jump_lock > 0) {
    wall_jump_lock -= 1;
} else if (estado != "dash" && !_dash_jump && !_wall_sliding) {
    hsp = _move * move_spd;
    if (_move != 0) face = _move;
} else if (_wall_sliding) {
    hsp = 0;
}

// --- Gravedad ---
if (estado != "dash") {
    if (on_ground) {
        vsp = 0;
    } else if (_wall_sliding) {
        vsp = wall_slide_spd;
    } else {
        vsp += grav;
        if (vsp > 10) vsp = 10;
    }
}

// --- Dash ---
if (_dash && dash_cooldown <= 0 && estado != "dash" && estado != "attack") {
    estado = "dash";
    dash_time = dash_time_max;
    hsp = face * dash_spd;
    vsp = 0;
}

if (estado == "dash") {
    dash_time -= 1;
    if (dash_time <= 0) {
        estado = "idle";
        if (!on_ground) {
            dash_cooldown = dash_cooldown_max;
        }
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

// --- Redondear posición ---
x = round(x);
y = round(y);

// --- Recalcular on_ground ---
on_ground = place_meeting(x, y+1, obj_solid);

// --- Actualizar estado (si no está en dash ni attack) ---
if (estado != "dash" && estado != "attack") {
    if (_wall_sliding) {
        estado = "wall_slide";
    } else if (!on_ground) {
        estado = (vsp < 0) ? "jump" : "fall";
    } else if (hsp != 0) {
        estado = "run";
    } else {
        estado = "idle";
    }
}

// --- Flip del sprite ---
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
        sprite_index = spr_zero_dash;
        break;
    case "wall_slide":
        sprite_index = spr_zero_wall_slide;
        break;
    case "attack":
        sprite_index = (arma == "espada") ? spr_zero_attack_sword : spr_zero_attack_shot;
        break;
}

if (sprite_index != _sprite_anterior) {
    image_index = 0;
    wall_slide_intro_done = false;
}

// --- Control especial de animación para wall_slide ---
if (estado == "wall_slide") {
    var _total_frames = sprite_get_number(spr_zero_wall_slide);
    var _loop_frames = 3;
    var _loop_start = _total_frames - _loop_frames;

    if (!wall_slide_intro_done) {
        if (image_index >= _loop_start) {
            wall_slide_intro_done = true;
        }
    } else {
        if (image_index < _loop_start) {
            image_index = _loop_start;
        }
    }
}