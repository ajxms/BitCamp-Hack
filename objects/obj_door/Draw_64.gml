/*draw_set_font(fnt_med);

// Show "Press Shift" when player is near
if (instance_exists(obj_player)) {
    var distance = point_distance(x, y, obj_player.x, obj_player.y);
    if (distance <= interaction_distance) {
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(x, y - 30, "Press SHIFT to enter");
        draw_set_halign(fa_left);
    }
}