// Instead of room_goto_next();
//room_goto(rm_level2); // Use the actual name of your next room
if(room == rm_level4){
    // 1. Create the win screen if it doesn't exist
    if (!instance_exists(obj_win_screen)) {
        var _win = instance_create_layer(0, 0, "Instances", obj_win_screen);
        _win.is_active = true;
    
        // 2. Freeze the player so they don't walk off screen
        other.xspd = 0;
        other.yspd = 0;
        other.can_move = false; // If you have a movement toggle
    }
}
else{
room_goto_next();
audio_play_sound(snd_door, 1, false);
}
