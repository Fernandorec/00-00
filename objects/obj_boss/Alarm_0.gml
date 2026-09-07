if (boss_state == "fly") {
    boss_state = "telegraph";
    active_attack = "dash";
    origin_x = x;
    origin_y = y;
    alarm[1] = 3 * room_speed;
} else {
    // Si está ocupado con otro ataque, reintenta en 1 segundo
    alarm[0] = room_speed;
}