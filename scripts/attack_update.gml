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