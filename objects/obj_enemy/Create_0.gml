// Hovering
hover_offset = 0;
hover_speed = 0.05;
hover_amount = 8; // How many pixels it moves up and down
anchor_y = y;    // The center point of the hover

// Detection & Combat
detect_radius = 350;
shoot_cooldown = 0;
shoot_delay = 90; // Frames between shots (1.5 seconds)

// Sprite
//image_speed = 1;

hp_max = 100;
hp = hp_max;
hp_bar_width = 40; // Total width in pixels
hp_bar_height = 6;

// Playlist array
voice_lines = [snd_silence, snd_detected, snd_shortenemy, snd_enemy];

// Voice Control
voice_cooldown = 0;
voice_delay_min = 180; // 3 seconds at 60fps
voice_delay_max = 420; // 7 seconds
voice_range = 350;     // Only talk if player is this close
