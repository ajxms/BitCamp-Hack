if (is_active) {
    // Fade in the background
    if (alpha < 0.8) alpha += 0.02;
    
    // Animate the text scale (Slight bounce effect)
    if (text_scale < 1.5) text_scale += 0.05;
    
    // Option to restart or quit
    if (keyboard_check_pressed(vk_enter)) {
        game_restart();
    }
}