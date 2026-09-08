if (is_dead) {
    draw_self(); // dibuja el sprite de muerte sin parpadeo
} else if (invincible && (invincible_timer mod 8 < 4)) {
    // Parpadeo: se salta el dibujo cada pocos frames
} else {
    draw_self();
}