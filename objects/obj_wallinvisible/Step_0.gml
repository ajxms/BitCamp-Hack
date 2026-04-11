//if (instance_exists(obj_player))
//{
	//if(obj_player.is_dashing && obj_player.x >= x- 35 && obj_player.x <= x+35)
	//{
		//instance_destroy();
	//}
	//if (place_meeting(x + 
//}

if( instance_exists(obj_player)){
	
	if obj_player.x >= x-90 && obj_player.x <= x+90 && obj_player.y <= y {
		image_index = 1;
	}
	else{
		image_index= 0;
	}
}