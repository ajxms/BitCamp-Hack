attribute vec3 in_Position; // (x, y, z)
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;

varying vec2 pos;

void main() {
    // Transform to screen
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    
    // Pass screen-space position (xy) to fragment shader
    pos = in_Position.xy;
}
