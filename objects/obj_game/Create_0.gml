rain_count = 100;
rain_created = false;
snd_played = false;
restart_timer = 30;

global.deathFlag = false;
if (!variable_global_exists("death_count")) {
    global.death_count = 0; // Initialize once
}


state = "title";  // start with title
timer = 0;        // for delays

pl = 960;
yl = 540;
