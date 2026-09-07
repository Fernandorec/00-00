if (boss_state == "fly") {
    boss_state = "shoot";
    origin_x = x;
    origin_y = y;
    shoot_time_left = shoot_duration;
    alarm[8] = shoot_interval; // dispara el primer proyectil casi de inmediato
}

alarm[7] = 9 * room_speed; // programa el siguiente intento