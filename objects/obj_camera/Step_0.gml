//fullscreen toggle
if keyboard_check_pressed(ord("F"))
	window_set_fullscreen(!window_get_fullscreen());

//exit if there is no player
if !instance_exists(obj_player) exit;

//get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//get camera target coordinates
var _camX = obj_player.x - _camWidth/2;
var _camY = obj_player.y - _camHeight/2;

//constrain cam to room border
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//set cam coordinate variables
finalCamX += (_camX-finalCamX) * camTrailSpd;
finalCamY += (_camY-finalCamY) * camTrailSpd;

//set camera coordinates

camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

// Get final camera position (rounded to prevent subpixel issues)
var cam_x = floor(finalCamX);
var cam_y = floor(finalCamY);

// Apply parallax scroll to background layers (rounded positions)
/*
layer_x("bg4", floor(cam_x * 0.1));
layer_y("bg4", floor(cam_y * 0.1));

layer_x("bg3", floor(cam_x * 0.23));
layer_y("bg3", floor(cam_y * 0.2));

layer_x("bg2", floor(cam_x * 0.3));
layer_y("bg2", floor(cam_y * 0.3));