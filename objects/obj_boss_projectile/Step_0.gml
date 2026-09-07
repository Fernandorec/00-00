x += dir_x * spd;
y += dir_y * spd;

// Rota el sprite para que apunte en la dirección real de vuelo
image_angle = point_direction(0, 0, dir_x, dir_y);

// Se destruye si sale de la arena o choca con una pared
if (place_meeting(x, y, obj_solid)) {
    instance_destroy();
}

if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}