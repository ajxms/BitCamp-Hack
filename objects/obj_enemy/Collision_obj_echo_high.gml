hp -= 5; // Decrease health
instance_destroy(other); // Destroy the echo

// Check for death
if (hp <= 0) {
    // Add a cool spark or explosion before destroying
    instance_destroy();
}

