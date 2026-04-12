gpu_set_texfilter(false); // Disables blurring/linear interpolation
// This forces the UI layer to match your actual screen resolution
display_set_gui_size(window_get_width(), window_get_height());
// --- 1. SETTINGS ---
var _margin = 30;       // Distance from the edge of the screen
var _sep = 45;          // Vertical space between each UI element
var _scale = 1;       // Makes the text 50% bigger
var _hp_w = 300;        // Wider health bar for better visibility

draw_set_font(fnt_main);
// --- 2. DRAW PLAYER HEALTH ---
var _hp_percent = (hp / hp_max) * 100;
// Draw Health Bar (Scaled up)
draw_healthbar(_margin, _margin, _margin + _hp_w, _margin + 30, _hp_percent, c_black, c_red, c_lime, 0, true, true);

draw_set_halign(fa_left);
draw_text_transformed(_margin, _margin + 40, "HEALTH", _scale, _scale, 0);

// --- 3. DRAW ECHO CHARGES (High Frequency) ---
var _high_y = _margin + (1 * _sep) + 40;
draw_set_color(c_aqua);
draw_text_transformed(_margin, _high_y, "HIGH FREQ: " + string(echo_high_count), _scale, _scale, 0);

// Draw Ammo Pips (Spaced out more)
for (var i = 0; i < echo_high_max; i++) {
    var _color = (i < echo_high_count) ? c_aqua : c_dkgray;
    draw_circle_color(_margin + 220 + (i * 25), _high_y + 12, 7, _color, _color, false);
}

// --- 4. DRAW ECHO CHARGES (Low Frequency) ---
var _low_y = _margin + (2 * _sep) + 40;
draw_set_color(c_red);
draw_text_transformed(_margin, _low_y, "LOW FREQ: " + string(echo_low_count), _scale, _scale, 0);

// Draw Ammo Pips
for (var i = 0; i < echo_low_max; i++) {
    var _color = (i < echo_low_count) ? c_red : c_dkgray;
    draw_circle_color(_margin + 220 + (i * 25), _low_y + 12, 7, _color, _color, false);
}

// --- 5. MODE INDICATOR (The "Twist") ---
var _mode_y = _margin + (3 * _sep) + 40;
var _mode_color = toggle_frequency ? c_red : c_aqua;
var _mode_text = toggle_frequency ? "MODE: LOW" : "MODE: HIGH";

draw_set_color(_mode_color);
draw_text_transformed(_margin, _mode_y, _mode_text, _scale * 1.2, _scale * 1.2, 0);

// Reset color for other drawing
draw_set_color(c_white);