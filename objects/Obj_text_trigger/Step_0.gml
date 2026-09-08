mostrando = false;

if (instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) <= radius) {
        mostrando = true;
    }
}