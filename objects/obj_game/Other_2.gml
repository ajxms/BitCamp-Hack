/*if (!rain_created) {
    repeat(rain_count) {
        // Create rain at random Y positions above screen
        instance_create_layer(random_range(0, 2048), 
                             random_range(-2000, -20), // Much larger range for staggering
                             "Instances", obj_rain);
    }
    rain_created = true;
} else {
    with (obj_rain) {
        instance_destroy();
    }
    rain_created = false;
}