//input

right_key  = keyboard_check(vk_right) || keyboard_check(ord("D"));
left_key   = keyboard_check(vk_left)  || keyboard_check(ord("A"));

getControls(); // Handles buffered inputs, etc.

//movement

moveDir = right_key - left_key;
if (moveDir != 0) { face = moveDir; }

runType = runKey;
xspd = moveDir * moveSpd[runType];


//collision
var _subpixel = 0.5;

// Horizontal collision with obj_wall
if (place_meeting(x + xspd, y, obj_wall)) {
    if (!place_meeting(x + xspd, y - abs(xspd) - 1, obj_wall)) {
        while (place_meeting(x + xspd, y, obj_wall)) { y -= _subpixel; }
    }
    else if (!place_meeting(x + xspd, y + abs(xspd) + 1, obj_wall)) {
        while (place_meeting(x + xspd, y, obj_wall)) { y += _subpixel; }
    }
    else {
        var _pixelcheck = _subpixel * sign(xspd);
        while (!place_meeting(x + _pixelcheck, y, obj_wall)) { x += _pixelcheck; }
        xspd = 0;
    }
}

// Horizontal collision with obj_wallinvisible (only when not dashing)
if (place_meeting(x + xspd, y, obj_wallinvisible) && !is_dashing) {
    if (!place_meeting(x + xspd, y - abs(xspd) - 1, obj_wallinvisible)) {
        while (place_meeting(x + xspd, y, obj_wallinvisible)) { y -= _subpixel; nearInvisibleWall = true; }
    }
    else if (!place_meeting(x + xspd, y + abs(xspd) + 1, obj_wallinvisible)) {
        while (place_meeting(x + xspd, y, obj_wallinvisible)) { y += _subpixel; nearInvisibleWall = true;}
    }
    else {
        var _pixelcheck = _subpixel * sign(xspd);
        while (!place_meeting(x + _pixelcheck, y, obj_wallinvisible)) { x += _pixelcheck; nearInvisibleWall = false;}
        xspd = 0;
    }
}



// Vertical collision with obj_wallinvisible (only when not dashing)
if (place_meeting(x, y + yspd, obj_wallinvisible) && !is_dashing) {
    if (!place_meeting(x - abs(yspd) - 1, y + yspd, obj_wallinvisible)) {
        while (place_meeting(x, y + yspd, obj_wallinvisible)) { x -= _subpixel; }
    }
    else if (!place_meeting(x + abs(yspd) + 1, y + yspd, obj_wallinvisible)) {
        while (place_meeting(x, y + yspd, obj_wallinvisible)) { x += _subpixel; }
    }
    else {
        var _pixelcheck = _subpixel * sign(yspd);
        while (!place_meeting(x, y + _pixelcheck, obj_wallinvisible)) { y += _pixelcheck; }
        yspd = 0;
    }
}


// Apply X movement
x += xspd;

//dash effect

if (keyboard_check_pressed(ord("L")) && dash_cooldown_timer <= 0 && !is_dashing) {
    is_dashing = true;
    dash_timer = dash_duration;
    dash_cooldown_timer = dash_cooldown;

		// Set dash direction (based on facing direction or input)
	    if (keyboard_check(vk_right)) {
	        dash_direction = 1;
	    } else if (keyboard_check(vk_left)) {
	        dash_direction = -1;
	    } else {
	        dash_direction = face; // Use facing direction
	    }
	}


/*
if (is_dashing) {
    var dash_move = dash_speed * dash_direction;
    
    // Check if we can move (no collision with either wall type)
    if (!place_meeting(x + dash_move, y, obj_wall) && 
        !place_meeting(x + dash_move, y, obj_wallinvisible) && 
        dash_timer > 0) {
        x += dash_move;
    }
    // If we hit obj_wallinvisible specifically, destroy it
    else if (place_meeting(x + dash_move, y, obj_wallinvisible) && dash_timer > 0) {
        x += dash_move;
        with (obj_wallinvisible) {
            if (place_meeting(x, y, other)) {
                instance_destroy();
            }
        }
    }
    // If we hit obj_wall or dash_timer is 0, stop dashing
    else {
        is_dashing = false;
        dash_timer = 0;
    }
    
    yspd = 0;
    dash_timer--;
}

if (dash_cooldown_timer > 0){ 
	dash_cooldown_timer--;
}
*/
//y movement

yspd += grav;

if onGround {
    jumpCount = 0;
} else {
    //if jumpCount == 0 { jumpCount = 1; }
}

// Modified jump logic for continuous jumping
if (up_keyBuffered && jumpCount < maxJumps) {
	
    up_keyBuffered = false;
    up_keyBufferedTimer = 0;

    jumpCount++;
    up_keyHoldTimer = jumpHoldFrames;
	
	//audio
	//audio_play_sound(snd_jump, 1, false);
	
}
// ADD THIS: Continuous jumping when on ground and holding jump key
else if (up_key && onGround && jumpCount == 0) {
    jumpCount++;
	
    up_keyHoldTimer = jumpHoldFrames;
}

if (!up_key) { up_keyHoldTimer = 0; }

if (up_keyHoldTimer > 0) {
    yspd = jspd;
    up_keyHoldTimer--;
}


// ----------------------------
// FLOOR COLLISION + MOVING PLATFORM
// ----------------------------
var _clampYspd = max(0, yspd);
var _list = ds_list_create();
var _array = array_create(0);
array_push(_array, obj_wall, obj_semisolidwall);

var _listSize = instance_place_list(x, y + 1 + _clampYspd + termVel, _array, _list, false);

for (var i = 0; i < _listSize; i++) {
    var _listInst = _list[| i];

    if ((_listInst.yspd <= yspd || instance_exists(myFloorPlat)) &&
        (_listInst.yspd > 0 || place_meeting(x, y + 1 + _clampYspd, _listInst))) {
        
        if (_listInst.object_index == obj_wall || object_is_ancestor(_listInst.object_index, obj_wall)
            || floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)) {
            
            if (!instance_exists(myFloorPlat) ||
                _listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd ||
                _listInst.bbox_top + _listInst.yspd <= bbox_bottom) {
                
                myFloorPlat = _listInst;
            }
        }
    }
}
ds_list_destroy(_list);

if yspd >= 0 && place_meeting(x, y+1, obj_wall)
{
	//jump_sndTimes = 0;
	onGround = true;
}else{
	onGround = false;
}


// ----------------------------
// LANDING ON PLATFORM
// ----------------------------
if (instance_exists(myFloorPlat)) {
    var _subPixel = 0.5;
    while (!place_meeting(x, y + _subPixel, myFloorPlat) && !place_meeting(x, y, obj_wall)) {
        y += _subPixel;
    }

    if (myFloorPlat.object_index == obj_semisolidwall ||
        object_is_ancestor(myFloorPlat.object_index, obj_semisolidwall)) {
        while (place_meeting(x, y, myFloorPlat)) { y -= _subPixel; }
    }

    y = floor(y);
    yspd = 0;
    setOnGround(true);
}


// ----------------------------
// Y POSITION UPDATE
// ----------------------------
y += yspd;


// ----------------------------
// MOVING PLATFORM OFFSET
// ----------------------------
if (instance_exists(myFloorPlat) && myFloorPlat.yspd != 0) {
    if ((!place_meeting(x, myFloorPlat.bbox_top, obj_wall)
        && myFloorPlat.bbox_top >= bbox_bottom - termVel) ||
        myFloorPlat.object_index == obj_semisolidwall ||
        object_is_ancestor(myFloorPlat.object_index, obj_semisolidwall)) {

        y = myFloorPlat.bbox_top;
    }

    if (myFloorPlat.yspd < 0 && place_meeting(x, y + myFloorPlat.yspd, obj_wall)) {
        if (myFloorPlat.object_index == obj_semisolidwall ||
            object_is_ancestor(myFloorPlat.object_index, obj_semisolidwall)) {
            
            var _subPPixel = 0.25;
            while (place_meeting(x, y + myFloorPlat.yspd, obj_wall)) { y += _subPPixel; }
            while (place_meeting(x, y, obj_wall)) { y -= _subPPixel; }
            y = round(y);
            setOnGround(false);

        }
    }
}


// ----------------------------
// CEILING COLLISION
// ----------------------------
if (yspd < 0 && place_meeting(x, y, obj_wall)) {
    while (place_meeting(x, y, obj_wall)) { y += 0.5; }
    yspd = 0;
    up_keyHoldTimer = 0;
}

// ----------------------------
// SPRITE & MASK UPDATES
// ----------------------------

if (is_dashing) {
    sprite_index = dashSpr;
	    // Play dash sound only when dash starts
    if (dash_timer == dash_duration - 1) {
        audio_play_sound(snd_dash, 1, false);
    }
} else if (!onGround ) {
    sprite_index = jumpSpr;
} else if (abs(xspd) >= moveSpd[1]) {
   // sprite_index = runSpr;
} else if (abs(xspd) > 0) {
    sprite_index = walkSpr;
} else {
    sprite_index = idleSpr;
}

mask_index = maskSpr;


//change the frequency
if( keyboard_check_pressed(ord("E"))){
    toggle_frequency = !toggle_frequency;
}

// Check for left mouse click
// --- 2. Shooting Logic ---
if (mouse_check_button_pressed(mb_left)) {
    var _dir = point_direction(x, y, mouse_x, mouse_y);
    
    // Determine which object to spawn
    var _obj_to_spawn = toggle_frequency ? obj_echo_low : obj_echo_high;
    var _obj_count = toggle_frequency ? 4: 6;
    // Use a loop to create the 3 echo layers (cleaner than copy-pasting)
    var _speeds = [8, 7.5, 7, 6.5];
    for (var i = 0; i < _obj_count; i++) {
        var _inst = instance_create_layer(x, y, "player", _obj_to_spawn);
        with (_inst) {
            direction = _dir;
            speed = _speeds[i];
            image_angle = _dir;
            
            // Visual Polish: Make the back layers slightly more transparent
            //image_alpha = 1 - (i * 0.2); 
        }
    }
}


// --- ECHO TRAIL LOGIC ---
// Track positions if we are in the air OR moving fast (selling the "Echo" speed)
if (!onGround || abs(xspd) > moveSpd[0]) {
    // Insert current position [x, y] at the start of the list
    ds_list_insert(trail_points, 0, [x, y]);
    
    // Keep the list at your max length
    if (ds_list_size(trail_points) > trail_max_length) {
        ds_list_delete(trail_points, trail_max_length);
    }
} else {
    // Gradually shorten the trail when standing still so it "retracts"
    if (ds_list_size(trail_points) > 0) {
        ds_list_delete(trail_points, ds_list_size(trail_points) - 1);
    }
}