// --- Calcula la escala para que el sprite coincida con el radio deseado ---
var _target_size = radius * 2; // el diámetro completo
var _scale = _target_size / sprite_base_size;

if (!triggered) {
    // --- Fase de aviso: se hace más visible con el tiempo ---
    var _alpha = 0.3 + (0.4 * (1 - (timer / telegraph_time))); // de 0.3 a 0.7
    draw_sprite_ext(sprite_index, image_index, x, y, _scale, _scale, 0, c_white, _alpha);
} else {
    // --- Fase de explosión: completamente visible/opaco ---
    draw_sprite_ext(sprite_index, image_index, x, y, _scale, _scale, 0, c_white, 1);
}