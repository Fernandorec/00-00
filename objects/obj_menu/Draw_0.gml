// --- Título ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(room_width / 2, room_height / 4, "CHRONOPHOBIA");

// --- Botón Jugar ---
draw_set_color(c_dkgray);
draw_rectangle(btn_jugar_x - btn_width/2, btn_jugar_y - btn_height/2, btn_jugar_x + btn_width/2, btn_jugar_y + btn_height/2, false);
draw_set_color(c_white);
draw_rectangle(btn_jugar_x - btn_width/2, btn_jugar_y - btn_height/2, btn_jugar_x + btn_width/2, btn_jugar_y + btn_height/2, true);
draw_text(btn_jugar_x, btn_jugar_y, "JUGAR");

// --- Botón Tutorial ---
draw_set_color(c_dkgray);
draw_rectangle(btn_tutorial_x - btn_width/2, btn_tutorial_y - btn_height/2, btn_tutorial_x + btn_width/2, btn_tutorial_y + btn_height/2, false);
draw_set_color(c_white);
draw_rectangle(btn_tutorial_x - btn_width/2, btn_tutorial_y - btn_height/2, btn_tutorial_x + btn_width/2, btn_tutorial_y + btn_height/2, true);
draw_text(btn_tutorial_x, btn_tutorial_y, "TUTORIAL");

// --- Botón Créditos ---
draw_set_color(c_dkgray);
draw_rectangle(btn_creditos_x - btn_width/2, btn_creditos_y - btn_height/2, btn_creditos_x + btn_width/2, btn_creditos_y + btn_height/2, false);
draw_set_color(c_white);
draw_rectangle(btn_creditos_x - btn_width/2, btn_creditos_y - btn_height/2, btn_creditos_x + btn_width/2, btn_creditos_y + btn_height/2, true);
draw_text(btn_creditos_x, btn_creditos_y, "CRÉDITOS");

draw_set_halign(fa_left);
draw_set_valign(fa_top);