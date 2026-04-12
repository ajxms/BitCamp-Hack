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
}

// Decrease cooldown over time
if (shoot_cooldown > 0) shoot_cooldown--;