// --- Crea varias zonas de congelamiento en posiciones aleatorias dentro de la arena ---
var _margin = 40; // margen para que no aparezcan pegadas a las paredes

for (var i = 0; i < freeze_zone_count; i++) {
    var _rx = irandom_range(_margin, room_width - _margin);
    var _ry = irandom_range(_margin, room_height - _margin);

    // Verifica que no aparezca dentro de una pared
    if (!place_meeting(_rx, _ry, obj_solid)) {
        instance_create_layer(_rx, _ry, "Instances", obj_freeze_zone);
    }
}

alarm[2] = 7 * room_speed; // programa la siguiente oleada