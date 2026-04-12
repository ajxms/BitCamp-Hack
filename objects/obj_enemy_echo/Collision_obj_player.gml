// Inside obj_enemy_echo -> Collision with obj_player
with(other) {
    // 1. Reduce Health
    hp -= 15; 
    
    // 2. Trigger Silence
    is_silenced = true;
    silence_timer = silence_duration;
    
    // 3. Create the "Floating Text"
    var _txt = instance_create_layer(x, y - 40, "UI_Layer", obj_ui_text);
    _txt.text_string = "YOU ARE SILENCED!";
    _txt.color = c_orange; // Or a glitchy purple
    
    // 4. Visual Feedback
    image_blend = c_gray; // Dim the player to show they're weakened
}

// Destroy the enemy echo
instance_destroy();