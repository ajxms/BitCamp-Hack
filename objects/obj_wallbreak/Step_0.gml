/*if(instance_exists(obj_player)){
	if(!is_breaking && y-79 >= obj_player.y && x-120 <= obj_player.x && x + 120 >= obj_player.x && y-180 <= obj_player.y)
	{
		sprite_index = wallCrack;
		start_destroy = true;
		
	}
	
	if(start_destroy)
	{
		if(sprite_index == wallCrack && image_index >= 6)
		{
			is_breaking = true;
			sprite_index = wallgone;
		}
		
	}
		else{
		sprite_index = normal;
	}
	
	if(is_breaking)
	{
		mask_index = -1;
	}
	
	if (is_breaking && image_index >= 6) {
    instance_destroy(); // remove wall when done
	}

}
