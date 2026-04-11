// Expand slightly over time to look like a spreading wave
image_xscale += 0.01;
image_yscale += 0.01;

// Fade out as it travels
image_alpha -= 0.005;

// Destroy it when it's invisible or off-screen
if (image_alpha <= 0) {
    instance_destroy();
}