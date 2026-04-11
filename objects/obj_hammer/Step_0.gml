// Check if player is under the object
if (instance_exists(obj_player)) {
    if ((x - 115) <= obj_player.x && (x + 110) >= obj_player.x && (y + 25) <= obj_player.y) {
        if (drop_count == 0) { // Only trigger on first detection
            playerOnBottom = true;
            is_falling = true;
			visible = true;
        }
    }
}

// Handle the reset timer
if (reset_timer > 0) {
    reset_timer--;
    if (reset_timer <= 0) {
        // Reset for next drop
        y = intY;
        yspd = 10;
        is_falling = true;
    }
}

// Make the object fall when triggered
if (is_falling) {
    y += yspd;
    yspd+= 0.5; // Increase fall speed (gravity effect)
}

// Check if object hit the floor (obj_wall)
if (instance_exists(obj_wall)) {
    if (y-intY >= 290  && is_falling) {
        drop_count++;
        is_falling = false;
        
        if (drop_count >= max_drops) {
            instance_destroy(); // Destroy after 3 drops
        } else {
            reset_timer = reset_delay; // Start delay before next drop
        }
    }
}

