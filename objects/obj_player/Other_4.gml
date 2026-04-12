
// --- Room Start Event ---

// 1. Check if a spawn point exists in this new room
if (instance_exists(obj_spawn_point)) {
    
    // 2. Move the persistent player to that object's coordinates
    x = obj_spawn_point.x;
    y = obj_spawn_point.y;
    
    // 3. Kill any leftover momentum from the previous room
    xspd = 0;
    yspd = 0;
    
    // 4. Clear the Echo Trail so it doesn't "streak" across the screen
    if (ds_exists(trail_points, ds_type_list)) {
        ds_list_clear(trail_points);
    }
}