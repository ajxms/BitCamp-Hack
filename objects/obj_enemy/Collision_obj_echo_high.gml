hp -= 5; // Decrease health
instance_destroy(other); // Destroy the echo

// Check for death
if (hp <= 0) {
    // Add a cool spark or explosion before destroying
    //instance_destroy();
    // Stop all voice lines for THIS specific enemy instance
for (var i = 0; i < array_length(voice_lines); i++) {
    audio_stop_sound(voice_lines[i]);
}
instance_destroy();
}

