// If nothing is being displayed, check if there's a message waiting in the queue
if (!active && ds_list_size(tutorial_queue) > 0) {
    current_text = tutorial_queue[| 0]; // Get the first message
    ds_list_delete(tutorial_queue, 0);   // Remove it from the list
    active = true;
}