if (boss_state == "fly") {
    boss_state = "silhouette";
    active_attack = "sweep";
    origin_x = x;
    origin_y = y;

    if (instance_exists(obj_player)) {
        // Guarda la posición del jugador UNA SOLA VEZ, en este instante
        sweep_target_x = obj_player.x;
        sweep_target_y = obj_player.y;

        silhouette_id = instance_create_layer(sweep_target_x, sweep_target_y, "Instances", obj_boss_silhouette);
        silhouette_id.lifetime = silhouette_time;
        silhouette_id.sprite_index = sprite_index;
        silhouette_id.image_xscale = image_xscale;
    }

    alarm[5] = silhouette_time;
}

alarm[4] = 8 * room_speed;