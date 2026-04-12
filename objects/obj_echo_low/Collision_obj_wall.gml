// Inside obj_echo_low -> Collision with obj_wall

if (other.object_index == obj_reflect_wall) {
    // 1. Logic for the Reflection Wall
    // (Don't destroy, just let your bounce code run)
    //move_bounce_solid(true); 
    
} else {
    // 2. Logic for the Basic Wall
    instance_destroy();
    
    // Optional: Create a small "thud" effect
  //  instance_create_layer(x, y, "Instances", obj_spark_low);
}