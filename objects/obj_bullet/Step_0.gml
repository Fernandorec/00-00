if (spawn_grace > 0) {
    spawn_grace -= 1;
} else if (place_meeting(x, y, obj_solid)) {
    instance_destroy();
}