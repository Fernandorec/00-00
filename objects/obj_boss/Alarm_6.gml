for (var i = 0; i < lightning_count; i++) {
    var _angle = (360 / lightning_count) * i;

    var _bolt = instance_create_layer(x, y, "Instances", obj_lightning);
    _bolt.owner = id;
    _bolt.base_angle = _angle;
    _bolt.orbit_radius = lightning_spread;
}

alarm[6] = 6 * room_speed;