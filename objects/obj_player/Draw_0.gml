

// 2. Draw the Echo Trail
if (ds_list_size(trail_points) > 1) {
    // Pick a color based on state (High/Low frequency feel)
//    var _color = is_dashing ? c_white : c_aqua; 
    var _color = c_red; 
    var _alpha = 0.8;

    draw_set_alpha(_alpha);
    draw_primitive_begin(pr_trianglestrip);

    for (var i = 0; i < ds_list_size(trail_points); i++) {
        var _pos = trail_points[| i];
        
        // Math to make the tail get thinner and more transparent as it gets older
        var _perc = 1 - (i / trail_max_length);
        var _thickness = _perc * 15; // Adjust 6 for wider/thinner trail
        
        draw_set_color(_color);
        
        // We draw two vertices per point to create the "width" of the ribbon
        // This follows your curved motion perfectly
        draw_vertex_color(_pos[0] - _thickness, _pos[1], _color, _alpha * _perc);
        draw_vertex_color(_pos[0] + _thickness, _pos[1], _color, _alpha * _perc);
    }

    draw_primitive_end();
    draw_set_alpha(1); // Reset alpha so it doesn't mess up other drawing
}

//Draw myself

draw_sprite_ext(sprite_index, image_index, x ,y, image_xscale*face,
image_yscale, image_angle, image_blend, image_alpha);
