
if (global.deathFlag){

	
	    // Play random death sound (0, 1, or 2 for all 3 sounds)
    /*var death_sounds = [snd_death1, snd_death2, snd_death3];
    var random_death = death_sounds[irandom(2)]; // Changed to irandom(2)
	if(!snd_played){
	audio_play_sound(random_death, 1, false);
		snd_played = true;
	}
    
    // Create a death overlay rectangle
    if (!instance_exists(obj_death_overlay)) {
        instance_create_layer(0, 0, "player", obj_death_overlay);
    }
	if (restart_timer <= 0)
	{
		if (instance_exists(obj_fake_door) && !obj_fake_door.door_enabled) {
			game_restart();
			global.death_count += 1;
		}
		else {
				obj_player.x = obj_player.xprevious;
				obj_player.y = obj_player.yprevious; 
				global.death_count += 1; 
		}
	}
	restart_timer--;
    */
}

/*
// Door interaction logic
if (instance_exists(obj_player) && instance_exists(obj_door)) {
    var door_distance = point_distance(obj_player.x, obj_player.y, obj_door.x, obj_door.y);
    
    if (door_distance <= obj_door.interaction_distance) {
        if (keyboard_check_pressed(vk_shift)) {
            // Set exam state BEFORE room change
            obj_player.is_exam = true;
            // Teleport player to exam room
            room_goto(rm_exam);
        }
    }
}

// Handle failed exam (only in main room)
if (room == rm_lobby && instance_exists(obj_player) && obj_player.is_failed) {
    obj_player.is_failed = false; // Reset the flag
    obj_player.x = random_range(5000, 6720); 
    obj_player.y = 200;
}






switch (state) {
    case "title":
        timer++;
        if (timer > room_speed * 2) { // show title for 2 seconds
            state = "tutorial_move";
            timer = 0;
        }
    break;

    case "tutorial_move":
        if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) 
		|| keyboard_check_pressed(ord("D"))){
            state = "tutorial_jump";
            timer = 0;
        }
    break;

    case "tutorial_jump":
        if (keyboard_check_pressed(vk_space)) { // or whatever jump key
            state = "tutorial_dash";
            timer = 0;
        }
    break;

    case "tutorial_dash":
        if (keyboard_check_pressed(ord("L"))) { // example dash key
            state = "gameplay";
        }
    break;

    case "gameplay":
        // normal game, tutorial is finished
    break;
}
