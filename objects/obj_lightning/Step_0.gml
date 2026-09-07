lifetime -= 1;
if (lifetime <= 0) {
    instance_destroy();
    exit;
}

if (instance_exists(owner)) {
    var _current_angle = base_angle + owner.lightning_rotation; // suma la rotación compartida del jefe

    x = owner.x + lengthdir_x(orbit_radius, _current_angle);
    y = owner.y + lengthdir_y(orbit_radius, _current_angle);

    image_angle = _current_angle - 90; // ajusta según orientación de tu sprite
} else {
    instance_destroy();
}

if (warn_timer > 0) {
    warn_timer -= 1;
}