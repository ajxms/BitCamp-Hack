if (instance_exists(my_target_wall)) {
    with (my_target_wall) {
        // Maybe the voice sensor just makes the wall pass-through 
        // instead of permanent destruction?
        instance_destroy(); 
    }
}
instance_destroy();