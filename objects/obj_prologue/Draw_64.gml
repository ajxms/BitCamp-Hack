draw_set_font(fnt_main);

// 1. Draw the dark overlay
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// 2. Draw the text
draw_set_alpha(1);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_set_font(fnt_ui); // Use your crisp font

draw_text_ext_transformed(display_get_gui_width()/2, display_get_gui_height()/2, 
    text_pages[current_page], 40, 600, 1.5, 1.5, 0);

draw_set_alpha(1); // Reset