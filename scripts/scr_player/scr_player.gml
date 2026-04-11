function controlsSetup()
{
	bufferTime = 3;
	up_keyBuffered = 0;
	up_keyBufferedTimer = 0;
}

function getControls ()
{	
	
	up_keyPressed = keyboard_check_pressed(vk_space) + keyboard_check_pressed(vk_up);
		up_keyPressed = clamp(up_keyPressed, 0, 1);
	up_key = keyboard_check(vk_space) + keyboard_check(vk_up);
		up_key = clamp(up_key, 0, 1);
	
	
	
	if up_keyPressed
	{
		up_keyBufferedTimer = bufferTime;
	}
	if  up_keyBufferedTimer > 0 
	{
		up_keyBuffered = 1;
		up_keyBufferedTimer--;
	} else {
		up_keyBuffered = 0;
	}
	
	runKey = keyboard_check(ord("W"));
	runKey = clamp(runKey, 0, 1);
}

function setOnGround (_val = true)
{
	if _val = true
		onGround = true;
	else
		onGround = false; 
		myFloorPlat = noone;
		
}

function spawnPosition() {
	if (obj_player.is_failed) {
		obj_player.x = random_range(0, room_width);	
		obj_player.y = 0; 
	}
	else {
		obj_player.x = 	215; 
		obj_player.y = 760; 
	}
}
