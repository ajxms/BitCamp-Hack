shader_set(light_shader);

// Send uniforms (center of light + radius)
shader_set_uniform_f(u_pos, obj_player.x, obj_player.y - 40); 
shader_set_uniform_f(u_radius, 250);

// Fullscreen rectangle so shader applies everywhere
draw_rectangle(0, 0, 8000, 3000, false);

shader_reset();
