if (active) {
    draw_set_halign(fa_center);
    draw_set_font(fnt_main);
    
    var _x = display_get_gui_width() / 2;
    var _y = 250;
    
    // Draw Shadow
    draw_set_color(c_black);
    draw_text_transformed(_x + 2, _y + 2, current_text, 1.2, 1.2, 0);
    
    // Draw Instruction
    draw_set_color(c_yellow); 
    draw_text_transformed(_x, _y, current_text, 1.2, 1.2, 0);
}