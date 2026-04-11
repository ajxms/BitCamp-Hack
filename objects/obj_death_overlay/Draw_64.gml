// Draw a semi-transparent black rectangle covering the whole screen
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, room_width, room_height, false);

// Reset drawing settings
draw_set_alpha(1);
draw_set_color(c_white);

// Optional: Add "You Died" text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(960, 540, "YOU DIED");
draw_set_halign(fa_left);
draw_set_valign(fa_top);