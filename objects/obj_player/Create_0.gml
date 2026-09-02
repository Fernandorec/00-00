// --- Variables de movimiento ---
hsp = 0;          // horizontal speed
vsp = 0;          // vertical speed
move_spd = 4;     // velocidad al correr
grav = 0.5;       // gravedad
jump_spd = -9;    // fuerza de salto
face = 1;         // 1 = derecha, -1 = izquierda

// --- Estado del personaje ---
estado = "idle";  // idle, run, jump, fall, dash

// --- Dash ---
dash_spd = 8;
dash_time = 0;
dash_time_max = 10;   // duración del dash en frames
dash_cooldown = 0;
dash_cooldown_max = 20;

// --- Control de suelo ---
on_ground = false;