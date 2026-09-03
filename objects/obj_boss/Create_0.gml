// --- Movimiento ---
hsp = 0;
vsp = 0;
move_spd = 2.5;      // un poco más rápido para que se sienta más ágil
face = 1;

// --- Movimiento aleatorio en 2D ---
move_dir_x = choose(-1, 0, 1);
move_dir_y = choose(-1, 0, 1);
move_timer = 0;
move_timer_min = 15;   // más corto = cambia de dirección más seguido = más errático
move_timer_max = 50;

// --- Pausa al chocar con pared ---
wall_pause_chance = 0.35;   // 35% de probabilidad de quedarse quieto al chocar
wall_pause_min = 20;         // mínimo de frames pausado (~0.3s)
wall_pause_max = 70;         // máximo de frames pausado (~1.2s)


// --- Sesgo hacia el centro ---
center_bias_timer = 0;
center_bias_after = 180; // después de 3 segundos (a 60fps) sin ir al centro, empieza a sesgar