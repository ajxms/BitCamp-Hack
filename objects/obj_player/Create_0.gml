persistent = true;
controlsSetup()


// Movement
face = 1;
moveDir = 0;
runType = 0;
moveSpd = [7, 13];
xspd = 0;
yspd = 0;

// Jumping
grav = 0.6;
termVel = 9;
jspd = -11.15;
up_keyHoldTimer = 0;
jumpHoldFrames = 18;
jumpCount = 0;
maxJumps = 1;     // Allows double jump
onGround = true;

// Platforming
myFloorPlat = noone;
moveplatXspd = 0;

// Dashing

dash_direction = 1;
dash_speed = 20;
dash_duration = 15;
dash_timer = 0;
dash_cooldown = 60;
dash_cooldown_timer = 0;
is_dashing = false;



// Sprites
maskSpr = spr_player;
idleSpr = spr_player;
walkSpr = spr_player;
//runSpr = spr_runFinal;
jumpSpr = spr_player;
dashSpr = spr_player;
/*
walkSpr = spr_player_walk;
//runSpr = spr_runFinal;
jumpSpr = spr_player_jump;
dashSpr = spr_player_dash;
*/

is_failed = false; 
is_exam = false; 



nearInvisibleWall = false;
spawnPosition()


//for jumping
trail_points = ds_list_create();
trail_max_length = 15; // How many "echo segments" follow you
is_jumping = false;

//low high toggle for now
toggle_frequency = false;


// Stats
hp_max = 100;
hp = hp_max;

// Echo Charges (Ammo)
echo_high_max = 5;
echo_high_count = echo_high_max;

echo_low_max = 3; // Maybe low frequency is "heavier" and has less ammo
echo_low_count = echo_low_max;

// Recharge logic (optional)
recharge_timer = 0;
recharge_speed = 120; // 2 second to gain 1 charge

// In obj_player Create Event
is_silenced = false;
silence_timer = 0;
silence_duration = 120; // 2 seconds at 60fps


run_audio_once = true;