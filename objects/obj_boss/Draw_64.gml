// --- Barra de vida del jefe ---
var _bar_w = 400; // antes 250, ahora más ancha
var _bar_h = 18;
var _bar_x = (display_get_gui_width() - _bar_w) / 2;
var _bar_y = 20;

// Fondo
draw_set_color(c_dkgray);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, false);

// Vida actual
var _hp_ratio = hp / max_hp;
draw_set_color(c_red);
draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_w * _hp_ratio), _bar_y + _bar_h, false);

// Borde
draw_set_color(c_white);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, true);

// Texto opcional con el nombre del jefe
draw_set_halign(fa_center);
draw_text(_bar_x + _bar_w/2, _bar_y - 16, "COPY X");
draw_set_halign(fa_left);