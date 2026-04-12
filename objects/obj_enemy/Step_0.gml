// --- 1. HOVERING LOGIC ---
hover_offset += hover_speed;
y = anchor_y + sin(hover_offset) * hover_amount;

// --- 2. FIND THE PLAYER ---
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    


    // --- 4. SHOOTING LOGIC ---
    if (_dist < detect_radius) {
                // --- 3. FLIP BASED ON PLAYER POSITION ---
        if (obj_player.x > x) {
            image_xscale *= 1; // Face Right
        } else {
            image_xscale *= -1; // Face Left
        }
        if (shoot_cooldown <= 0) {
            // Create the enemy's echo
            var _dir = point_direction(x, y, obj_player.x, obj_player.y);
            var _echo = instance_create_layer(x, y, "player", obj_enemy_echo);
            
            with (_echo) {
                direction = _dir;
                speed = 5; // Enemies usually shoot slower than the player
                image_angle = direction;
            }
            
            // Reset cooldown
            shoot_cooldown = shoot_delay;
            
            // Optional: Add a "charging" effect or sound
            // audio_play_sound(snd_enemy_shoot, 1, false);
        }
    }
    // 2. Timer Countdown
    if (voice_cooldown > 0) {
        voice_cooldown--;
    } 
    // 3. Play Random Voice if in range and not already talking
    else if (_dist < voice_range) {
        
        // Pick a random index from the array
        var _random_index = irandom(array_length(voice_lines) - 1);
        var _chosen_snd = voice_lines[_random_index];

        // Play the sound (ensures we don't restart it if it's already playing)
        if (!audio_is_playing(_chosen_snd)) {
            audio_play_sound(_chosen_snd, 5, false);
            
            // Set a random cooldown so they don't sound repetitive
            voice_cooldown = irandom_range(voice_delay_min, voice_delay_max);
        }
    }
}

// Decrease cooldown over time
if (shoot_cooldown > 0) shoot_cooldown--;