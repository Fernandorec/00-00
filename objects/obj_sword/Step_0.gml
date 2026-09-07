lifetime -= 1;
if (lifetime <= 0) {
    instance_destroy();
    exit;
}

// --- Sigue al jugador mientras dura el ataque ---
if (instance_exists(owner)) {
    x = owner.x + (owner.face * offset_x);
    y = owner.y + offset_y;
} else {
    instance_destroy();
    exit;
}

// --- Daño al jefe (solo una vez por espadazo) ---
if (!hit_done && instance_exists(obj_boss)) {
    if (place_meeting(x, y, obj_boss)) {
        obj_boss.hp -= 5;
        hit_done = true;

        if (obj_boss.hp <= 0) {
            obj_boss.hp = 0;
            instance_destroy(obj_boss);
        }
    }
}