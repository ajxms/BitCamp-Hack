// Expand slightly over time to look like a spreading wave
//image_xscale += 0.01;
//image_yscale += 0.01;


// Step Event of obj_echo_low
lifetime--;

if (lifetime < 30) {
    image_alpha -= 0.03; // Only fade out at the very end
}

if (lifetime <= 0) {
    instance_destroy();
}