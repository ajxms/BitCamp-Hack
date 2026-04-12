// 1. Activation Phase
if (!has_triggered && !is_active && place_meeting(x, y, obj_player)) {
    is_active = true;
    
    // Tell the manager to add this text to the "Waiting Line"
    if (instance_exists(obj_tutorial_manager)) {
        ds_list_add(obj_tutorial_manager.tutorial_queue, instruction_text);
    }
}

// 2. Monitoring Phase
// We only check for task completion if the MANAGER is currently showing OUR text
if (is_active && instance_exists(obj_tutorial_manager)) {
    
    if (obj_tutorial_manager.current_text == instruction_text) {
        
        switch (task_type) {
            case "jump": if (obj_player.jumpCount == 0) has_triggered = true; break;
            case "shoot": if (mouse_check_button_pressed(mb_left)) has_triggered = true; break;
            case "toggle": if (keyboard_check_pressed(ord("E"))) has_triggered = true; break;
            case "move": if (abs(obj_player.x - x) >= 200) has_triggered = true; break;
            case "press_button": if((instance_exists(obj_button)) && obj_button.image_index == 1) has_triggered = true; break;
            case "button_pressed": if (!instance_exists(obj_voice)) has_triggered = true; break;
            case "defeat" : if (!instance_exists(obj_voice)) has_triggered = true; break;
        }
        
        if (has_triggered) {
            is_active = false;
            obj_tutorial_manager.active = false; // Tell manager we are done!
            obj_tutorial_manager.current_text = "";
        }
    }
}