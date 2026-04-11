// Make the rain fall
y += y_fall;
y_fall += 0.2;
x += x_fall; 
// Gravity effect (optional)

// Check if rain hit the ground
if (instance_exists(obj_wall)) {
    if (y >= (obj_wall.y - 8)) {
        // Reset rain to top with random X position
        y = -20;
        x = random_range(0, room_width);
        y_fall = initial_fall_speed; // Reset fall speed
    }
}