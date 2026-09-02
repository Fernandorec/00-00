lifetime -= 1;
if (lifetime <= 0) {
    instance_destroy();
    exit;
}

if (instance_exists(owner)) {
    x = owner.x + (owner.face * offset_x);
    y = owner.y + offset_y;
} else {
    instance_destroy();
}