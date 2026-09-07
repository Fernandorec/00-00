timer -= 1;

if (timer <= 0 && !triggered) {
    triggered = true;
    active_hit = true;
    alarm[0] = 15; // destruye el círculo tras el flash de explosión
}