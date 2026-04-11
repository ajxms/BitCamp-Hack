// Check if player is near and presses F
if (instance_exists(obj_player)) {
    var distance = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (distance <= interaction_distance) {
        // Show interaction prompt (optional)
        // You could draw "Press F" above the door
        
        if (keyboard_check_pressed(vk_shift) && !message_shown) {
            // Create message box
            instance_create_layer(room_width/2, room_height/2, "Instances", obj_message_box);
            message_shown = true;
			door_enabled = true; 
			
			
            // Make the real door visible
            if (instance_exists(obj_door)) {
                obj_door.visible = true;
            }
        }
    }
}