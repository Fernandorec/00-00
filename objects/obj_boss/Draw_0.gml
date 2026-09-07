// Dibuja la barra de advertencia mientras está en "telegraph"
if (boss_state == "telegraph") {
    draw_set_color(c_red);
    draw_line_width(x, y, telegraph_target_x, telegraph_target_y, 3);
    draw_set_color(c_white);
}

// El jefe se oculta mientras solo la silueta debe ser visible
if (boss_state != "silhouette") {
    var _width_scale = 1.4; // qué tan ancho se ve, ajusta a tu gusto
draw_sprite_ext(sprite_index, image_index, x + shake_x, y + shake_y, image_xscale * _width_scale, image_yscale, image_angle, image_blend, image_alpha);
}