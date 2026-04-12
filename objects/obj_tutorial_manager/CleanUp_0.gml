// Check if the list exists before trying to free the memory
if (ds_exists(tutorial_queue, ds_type_list)) {
    ds_list_destroy(tutorial_queue);
}