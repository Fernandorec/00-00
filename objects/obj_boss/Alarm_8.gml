if (boss_state == "shoot" && instance_exists(obj_player)) {
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);

    var _proj = instance_create_layer(x, y, "Instances", obj_boss_projectile);
    _proj.dir_x = lengthdir_x(1, _dir);
    _proj.dir_y = lengthdir_y(1, _dir);

    alarm[8] = shoot_interval; // programa el siguiente disparo
}