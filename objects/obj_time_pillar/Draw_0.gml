if (!triggered) {
    // --- Fase de aviso: línea fina roja, se hace más visible con el tiempo ---
    var _alpha = 0.2 + (0.5 * (1 - (timer / telegraph_time)));
    draw_set_alpha(_alpha);
    draw_set_color(c_red);
    draw_line_width(x, top_y, x, bottom_y, 4);
} else {
    // --- Fase activa: columna gruesa y sólida ---
    draw_set_alpha(0.85);
    draw_set_color(c_aqua);
    draw_rectangle(x - pillar_width/2, top_y, x + pillar_width/2, bottom_y, false);
}

draw_set_alpha(1);
draw_set_color(c_white);