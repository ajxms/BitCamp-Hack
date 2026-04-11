dir += rotSpd;

// Apply the offset here to desync movement
var _actualDir = dir + dir_offset;

// Calculate target positions (mostly vertical)
var _targetX = xstart;
var _targetY = ystart;

if (vertical)
{
	
	_targetY += lengthdir_y(radius, _actualDir);
}
if (horizontal)
{
	_targetX += lengthdir_x(radius, _actualDir);
}

xspd = _targetX - x;
yspd = _targetY - y;

x += xspd;
y += yspd;
