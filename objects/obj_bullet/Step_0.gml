if (spawn_grace > 0) {
    spawn_grace -= 1;
} else if (place_meeting(x, y, obj_solid)) {
    instance_destroy();
}

if (instance_exists(obj_boss) && place_meeting(x, y, obj_boss)) {
    obj_boss.hp -= 2;
    instance_destroy();

    if (obj_boss.hp <= 0) {
        obj_boss.hp = 0;
    }
}