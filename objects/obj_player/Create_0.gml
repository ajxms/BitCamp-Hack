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
jspd = -9.15;
up_keyHoldTimer = 0;
jumpHoldFrames = 18;
jumpCount = 0;
maxJumps = 2;     // Allows double jump
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
maskSpr = spr_playerholder;
idleSpr = spr_playerholder;
walkSpr = spr_playerholder;
//runSpr = spr_runFinal;
jumpSpr = spr_playerholder;
dashSpr = spr_playerholder;
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


