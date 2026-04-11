// Just assign the shader by name (GameMaker compiles it in)
light_shader = shd_light;

// Get handles for uniforms
u_pos    = shader_get_uniform(light_shader, "u_pos");
u_radius = shader_get_uniform(light_shader, "u_radius");
