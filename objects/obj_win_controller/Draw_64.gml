if (is_active) {
    var _sw = display_get_gui_width();
    var _sh = display_get_gui_height();

    // 1. Draw Dark Overlay
    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _sw, _sh, false);
    draw_set_font(fnt_main);

    // 2. Draw Text
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Title
    draw_set_color(c_yellow);
    draw_text_transformed(_sw/2, _sh/2 - 50, "MISSION COMPLETE", text_scale, text_scale, 0);
    
    // Subtitle
    draw_set_color(c_white);
    draw_text_transformed(_sw/2, _sh/2 + 50, "Frequencies Restored.\nPress [ENTER] to Restart", 1, 1, 0);
}