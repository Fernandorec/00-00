if (instance_exists(obj_player)) {
    var _zone = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_freeze_zone);
    _zone.radius = 200;
}

alarm[3] = 7 * room_speed; // programa el siguiente