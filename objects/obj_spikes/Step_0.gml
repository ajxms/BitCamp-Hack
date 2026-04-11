
if(!playerOnTop) { intY = y; }

if (instance_exists(obj_player)){
	if( (x-50)<= obj_player.x && (x+50) >= obj_player.x && ( (y-25) >= obj_player.y))
		{
		playerOnTop = true;
		}
}

if(playerOnTop)
{
	y += yspd;
	yspd--;
}

if( y <=0)
{
	y= intY;
	playerOnTop = false;
	yspd = -2;
}
