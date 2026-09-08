if (mostrando) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();

    var _padding = 20; // espacio extra alrededor del texto

    var _text_w = string_width(texto);
    var _text_h = string_height(texto);

    var _box_w = _text_w + _padding * 2;
    var _box_h = _text_h + _padding * 2;
    var _box_x = (_gui_w - _box_w) / 2;
    var _box_y = 40;

    // --- Fondo del recuadro ---
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);

    // --- Contorno gris ---
    draw_set_alpha(1);
    draw_set_color(c_gray);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

    // --- Texto centrado dentro del recuadro ---
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_box_x + _box_w/2, _box_y + _box_h/2, texto);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}