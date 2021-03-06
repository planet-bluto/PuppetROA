// attack_update

//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

//Dattack
if (attack == AT_DATTACK){
    if (window == 1 && window_timer == 14){
        // spawn_hit_fx(x-54*spr_dir,y-54, fx_dattack);

    }
    if (window >= 2){
        set_attack_value(AT_DATTACK, AG_CATEGORY, 1);
    } else {
        reset_attack_value(AT_DATTACK, AG_CATEGORY);
    }
    
}

//Fspecial Grab
//attack_update.gml
if (attack == AT_FSPECIAL) {
	//reset 'grabbed_player' variables on the first frame when performing a grab.
    if (window == 1 && window_timer == 1) { 
    	grabbed_player_obj = noone; 
    	grabbed_player_relative_x = 0;
    	grabbed_player_relative_y = 0;
    }
}
if (attack == AT_FSPECIAL_2 && window == 1 && window_timer == 6){
    if (spr_dir == 1){
		    spr_dir = -1
	} else {
		    spr_dir = 1
	}
}
if (attack == AT_FSPECIAL_2 && instance_exists(grabbed_player_obj)) {
	
	//first, drop the grabbed player if this is the last window of the attack, or if they somehow escaped hitstun.
	if (window >= get_attack_value(attack, AG_NUM_WINDOWS)) { 
	    with(grabbed_player_obj){
	        visible = true
	    }
	    grabbed_player_obj = noone;
	}
	else if (grabbed_player_obj.state != PS_HITSTUN && grabbed_player_obj.state != PS_HITSTUN_LAND) {
	    with(grabbed_player_obj){
	        visible = true
	    }
	    grabbed_player_obj = noone;
	}
	else {
		//keep the grabbed player in hitstop until the grab is complete.
		grabbed_player_obj.hitstop = 2;
		grabbed_player_obj.hitpause = true;
		
		//if this is the first frame of a window, store the grabbed player's relative position.
		if (window_timer <= 1) {
			grabbed_player_relative_x = grabbed_player_obj.x - x;
			grabbed_player_relative_y = grabbed_player_obj.y - y;
		}
		 
		//on the first window, pull the opponent into the grab.
		if (window == 1 && window_timer == 20) { 
			//change as necessary. by default, this grab will pull the opponent to (30, 0) in front of the player.
			var pull_to_x = 140 * spr_dir;
			var pull_to_y = 0;
			
			//using an easing function, smoothly pull the opponent into the grab over the duration of this window.
			var window_length = get_window_value(attack, window, AG_WINDOW_LENGTH);
			grabbed_player_obj.x = x + ease_circOut( grabbed_player_relative_x, pull_to_x, window_timer, window_length);
			grabbed_player_obj.y = y + ease_circOut( grabbed_player_relative_y, pull_to_y, window_timer, window_length);
		}
		//the above block can be copied for as many windows as necessary.
		//e.g. for an attack like Clairen's back throw, you might have an additional window where the grabbed player is pulled behind.
	}
}