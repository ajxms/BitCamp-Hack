varying vec2 pos;

uniform vec2 u_pos;     // light center (player position)
uniform float u_radius; // light radius


void main() {
    // Distance from pixel to light center
    float d = length(pos - u_pos);

    // Normalize distance (0 = center, 1 = edge of radius)
    float t = clamp(d / u_radius, 0.0, 0.86);

    // Optional: tweak falloff smoothness
    float alpha = pow(t, 2.0); // quadratic falloff (smoother)
	
    

    // Darkness is black with alpha = distance factor
    gl_FragColor = vec4(0.0, 0.0, 0.0, alpha);
}
