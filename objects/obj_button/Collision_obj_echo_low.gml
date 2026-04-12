// Make sure we have a target assigned
if (instance_exists(my_target_wall)) {
    with (my_target_wall) {
        instance_destroy(); // Only THIS specific instance dies
    }
    instance_destroy(other); // Destroy the echo
    image_index = 1;
}