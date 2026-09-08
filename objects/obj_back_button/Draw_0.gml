draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_dkgray);
draw_rectangle(btn_x - btn_width/2, btn_y - btn_height/2, btn_x + btn_width/2, btn_y + btn_height/2, false);
draw_set_color(c_white);
draw_rectangle(btn_x - btn_width/2, btn_y - btn_height/2, btn_x + btn_width/2, btn_y + btn_height/2, true);
draw_text(btn_x, btn_y, "< VOLVER");

draw_set_halign(fa_left);
draw_set_valign(fa_top);