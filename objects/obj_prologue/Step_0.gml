// Fade in the background
if (alpha < 0.8) alpha += fade_speed;

// Advance text on key press
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_anykey)) {
    current_page++;
    
    // If we run out of pages, destroy the overlay to start the game
    if (current_page >= array_length(text_pages)) {
        instance_destroy();
    }
}