// 1. Draw the robot itself
draw_self();

// 2. Only draw the health bar if they've taken damage (optional polish)
if (hp < hp_max) {
    var _x1 = x - (hp_bar_width / 2);
    var _y1 = y - 40; // Position it 40 pixels above the center
    var _x2 = _x1 + hp_bar_width;
    var _y2 = _y1 + hp_bar_height;
    
    // Calculate how full the bar should be (0 to 100)
    var _hp_percent = (hp / hp_max) * 100;
    
    // Draw Background (Black)
    draw_set_color(c_black);
    draw_rectangle(_x1 - 1, _y1 - 1, _x2 + 1, _y2 + 1, false);
    
    // Draw the Health (Cyan to match high frequency!)
    // Using draw_healthbar makes this super easy
    draw_healthbar(_x1, _y1, _x2, _y2, _hp_percent, c_black, c_red, c_aqua, 0, true, true);
}