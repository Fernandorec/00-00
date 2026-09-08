// --- Barra de vida de Zero ---
var _bar_w = 150;
var _bar_h = 14;
var _bar_x = 20;
var _bar_y = 20;

draw_set_color(c_dkgray);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, false);

var _hp_ratio = hp / max_hp;
draw_set_color(c_lime);
draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_w * _hp_ratio), _bar_y + _bar_h, false);

draw_set_color(c_white);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, true);

if (is_dead) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    draw_sprite_stretched(spr_death, 0, 0, 0, _gui_w, _gui_h);
}