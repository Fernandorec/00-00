// --- Sistema de vida ---
hp = 150;
max_hp = 150;


// --- Movimiento tipo onda senoidal ---
move_spd = 4;
face = 1;
h_dir = 1;

// --- Configuración de la onda ---
wave_amplitude = 40;
wave_frequency = 0.1;
wave_offset = 0;
base_y = y;

// --- Sacudida al volar ---
shake_x = 0;
shake_y = 0;
shake_amount = 3;
shake_timer = 0;
shake_timer_max = 4;

// --- Sistema de ataque (dash telegráfico) ---
boss_state = "fly"; // fly, telegraph, dash, return

origin_x = x;
origin_y = y;

telegraph_target_x = 0;
telegraph_target_y = 0;

dash_spd = 10;
return_spd = 7;

alarm[0] = 5 * room_speed; // primer ataque a los 5 segundos


// --- Sistema de congelamiento (freeze zones) ---
freeze_zone_count = 3;    // cuántos círculos aparecen por oleada
alarm[2] = 7 * room_speed; // primera oleada a los 7 segundos

// --- Segundo ataque: círculo grande centrado en Zero ---
alarm[3] = 7 * room_speed; // cada 7 segundos también (ajusta si lo quieres en otro timing)

// --- Ataque de embestida horizontal (silueta + barrido) ---
sweep_spd = 12;
sweep_duration = 2.5 * room_speed; // ~2.5 segundos rebotando
sweep_time_left = 0;
sweep_dir = 1;
silhouette_time = 3 * room_speed;
sweep_y_offset = 25; // qué tanto se eleva del suelo al aparecer, ajusta según tu sprite
silhouette_id = noone; // referencia a la instancia de silueta actual
active_attack = "none"; // "dash" o "sweep", para saber qué timer reprogramar al volver

alarm[4] = 8 * room_speed; // cada 8 segundos intenta este ataque
sweep_fixed_y = 0;
sweep_fixed_y = 0;

sweep_target_x = 0;
sweep_target_y = 0;


arena_left = 64;
arena_right = room_width - 64;
arena_top = 64;
arena_bottom = room_height - 64;


// --- Rayos alrededor del jefe ---
lightning_count = 8;      // cuántos rayos aparecen por oleada
lightning_spread = 200;    // qué tan lejos del jefe pueden aparecer (radio)
alarm[6] = 6 * room_speed; // cada 6 segundos, ajusta a tu gusto

lightning_rotation = 0; // ángulo compartido que gira con el tiempo, define la rotación de todo el conjunto
lightning_rotation_speed = 1; // qué tan rápido gira el anillo completo (grados por frame)

// --- Ataque de disparos fijos ---
shoot_duration = 5 * room_speed;   // 5 segundos totales
shoot_interval = 0.3 * room_speed; // dispara cada 0.3 segundos
shoot_time_left = 0;
alarm[7] = 9 * room_speed; // cada cuánto se repite este ataque completo, ajusta a tu gusto


// --- Pilares de tiempo ---
pillar_count = 3;
pillar_spread = 50; // separación entre cada pilar
alarm[9] = 10 * room_speed;