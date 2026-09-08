if (instance_exists(obj_player)) {
    if (place_meeting(obj_player.x, obj_player.y, id)) {
        obj_player.hp = 0;
        room_restart();
    }
}