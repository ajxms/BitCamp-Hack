// Clear the queue on room restart
if (ds_exists(tutorial_queue, ds_type_list)) {
    ds_list_clear(tutorial_queue);
}
active = false;
current_text = "";