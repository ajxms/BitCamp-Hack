/*draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(#FFD700);
draw_set_font(fnt_med);
if (global.death_count == 0) {
	switch (state) {
    case "title":
	draw_set_font(fnt_main);
        draw_text(pl, yl, "Shadow Trap");
    break;

    case "tutorial_move":
	draw_set_font(fnt_med);
        draw_text(pl, yl, "Use A & D or Arrow Keys to move");
    break;

    case "tutorial_jump":
	draw_set_font(fnt_med);
        draw_text(pl, yl, "Press SPACE to jump");
    break;

    case "tutorial_dash":
	draw_set_font(fnt_med);
        draw_text(pl, yl, "Press L to dash");
    break;
}
}


draw_set_font(fnt_med);
draw_set_color(c_red);
draw_text(960,70, "Death Counter: " + string( global.death_count));


