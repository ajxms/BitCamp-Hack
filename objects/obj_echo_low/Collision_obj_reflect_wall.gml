// 1. "Rewind" the echo to the edge of the wall
// This moves the echo back pixel-by-pixel until it's just outside the wall
while (place_meeting(x, y, other)) {
    x -= lengthdir_x(1, direction);
    y -= lengthdir_y(1, direction);
}

// 2. Determine the bounce axis
// We check a tiny bit ahead to see which side we hit
if (place_meeting(x + hspeed, y, other)) {
    hspeed = -hspeed; // Hit a vertical wall (left or right side)
} 

if (place_meeting(x, y + vspeed, other)) {
    vspeed = -vspeed; // Hit a horizontal wall (top or bottom side)
}

// 3. Update the angle and push it out 1 pixel so it doesn't get stuck
image_angle = direction;
x += hspeed; 
y += vspeed;