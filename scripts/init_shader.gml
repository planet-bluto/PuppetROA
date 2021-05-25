//Changes eye colour if facing right
//Galaxy Colours
if (get_player_color(player) == 0){
    //Left Eye
    set_character_color_slot( 5, get_color_profile_slot_r(get_player_color(player), 4), get_color_profile_slot_g(get_player_color(player),4), get_color_profile_slot_b(get_player_color(player), 4));
    //Right Eye
    set_character_color_slot( 6, get_color_profile_slot_r(get_player_color(player), 4), get_color_profile_slot_g(get_player_color(player),4), get_color_profile_slot_b(get_player_color(player), 4));

}

if ("spr_dir" in self) {

    if (spr_dir == 1){
        //Left Eye
        set_character_color_slot( 5, get_color_profile_slot_r(get_player_color(player), 5), get_color_profile_slot_g(get_player_color(player), 5), get_color_profile_slot_b(get_player_color(player), 5));
        //Right Eye
        set_character_color_slot( 6, get_color_profile_slot_r(get_player_color(player), 6), get_color_profile_slot_g(get_player_color(player), 6), get_color_profile_slot_b(get_player_color(player), 6));
    }


    //Changes eye colour if facing left
    if (spr_dir == -1){
        //Left Eye
        set_character_color_slot( 5, get_color_profile_slot_r(get_player_color(player), 6), get_color_profile_slot_g(get_player_color(player), 6), get_color_profile_slot_b(get_player_color(player), 6));
        //Right Eye
        set_character_color_slot( 6, get_color_profile_slot_r(get_player_color(player), 5), get_color_profile_slot_g(get_player_color(player), 5), get_color_profile_slot_b(get_player_color(player), 5));
    }

}
