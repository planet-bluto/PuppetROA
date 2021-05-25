// update is useless, wtf

//Trail Effects
if(state == PS_AIR_DODGE){
    if(state_timer == 1){
        caligraphy_number = random_func( 0, 2, true );
    }
	if(state_timer % 8 == 0){
	    switch (caligraphy_number){
	        case(0):
                spawn_hit_fx((x - 20 * spr_dir), y - 70, fx_caligraphy1);
                break;
            case(1):
                spawn_hit_fx((x - 20 * spr_dir), y - 70, fx_caligraphy2);
                break;
	    }
	}
}