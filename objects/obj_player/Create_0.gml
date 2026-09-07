// --- Variables de movimiento ---
hsp = 0;
vsp = 0;
move_spd = 4;
grav = 0.5;
jump_spd = -9;
face = 1;

// --- Estado del personaje ---
estado = "idle";  // idle, run, jump, fall, dash, wall_slide, attack

// --- Dash ---
dash_spd = 8;
dash_time = 0;
dash_time_max = 10;
dash_cooldown = 0;
dash_cooldown_max = 20;
dash_jump_boost = 1.3;

// --- Control de suelo ---
on_ground = false;

// --- Wall Jump / Wall Slide ---
wall_slide_spd = 1.5;
wall_jump_hsp = 6;
wall_jump_vsp = -10;
on_wall = false;
wall_dir = 0;
wall_jump_lock = 0;
wall_jump_lock_max = 2;
wall_slide_intro_done = false;

// --- Sistema de armas ---
arma = "espada";
attack_time = 0;
attack_duration = 15;
bullet_spawned = false;

// --- Cooldown de ataque ---
attack_cooldown = 0;
attack_cooldown_max = 20; // ajusta a tu gusto

// --- Congelamiento ---
frozen = false;
freeze_timer = 0;

// --- Cámara ---
cam_smooth = 0.1; // qué tan suave sigue la cámara (más bajo = más suave/lento)

// --- Sistema de vida ---
hp = 75;
max_hp = 75;
invincible = false;
invincible_timer = 0;
invincible_duration = 60; // 1 segundo de i-frames
pillar_hit = false;
lightning_hit = false;

spd_base = 4;           // tu velocidad normal
spd_multiplier = 1;     // 1 = normal, <1 = lento, >1 = rápido
spd_multiplier_target = 1;