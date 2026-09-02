// Destrucción al chocar con un sólido (esto ya lo tenías, solo verifica que exista)
if (place_meeting(x, y, obj_solid)) {
    instance_destroy();
}