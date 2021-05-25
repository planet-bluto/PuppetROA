// Custom Skin

switch (color_slot) {
	case 6:
		if ("rb_merge" not in self) {
			int_rb_merge = 1
			rb_merge = 1
			const_merge_speed = 150
			rb_up = true
		}

		red = make_colour_rgb(234,29,35)
		blue = make_colour_rgb(0,161,230)
		color = merge_colour(red,blue,rb_merge)

		if (rb_up and int_rb_merge == const_merge_speed) {
			rb_up = false
		} else if (not rb_up and int_rb_merge == 0) {
			rb_up = true
		}

		if (rb_up) {
			int_rb_merge += 1
			rb_merge = (ease_backInOut(0, const_merge_speed, int_rb_merge, const_merge_speed, 0))/const_merge_speed
		} else {
			int_rb_merge -= 1
			rb_merge = (ease_backInOut(0, const_merge_speed, int_rb_merge, const_merge_speed, 0))/const_merge_speed
		}

		color1[0] = colour_get_red(color)
		color1[1] = colour_get_green(color)
		color1[2] = colour_get_blue(color)

		color2[0] = colour_get_red(color)-50
		color2[1] = colour_get_green(color)-50
		color2[2] = colour_get_blue(color)-50

		color3[0] = colour_get_red(color)-20
		color3[1] = colour_get_green(color)-20
		color3[2] = colour_get_blue(color)-20

		set_color_profile_slot( 6, 2, color3[0], color3[1], color3[2] );
		//set_color_profile_slot( 6, 3, color2[0], color2[1], color2[2] );
		set_color_profile_slot( 6, 4, color1[0], color1[1], color1[2] );
		init_shader()
	break;
}
if ("practice_plus_plus_color" in self) {
	if (practice_plus_plus_color != practice_plus_plus_current_color) {
		practice_plus_plus_current_color = practice_plus_plus_color
		p_r = colour_get_red(practice_plus_plus_color)
		p_g = colour_get_green(practice_plus_plus_color)
		p_b = colour_get_blue(practice_plus_plus_color)

		set_color_profile_slot( color_slot, 0, p_r, p_g, p_b)
		set_color_profile_slot( color_slot, 1, p_r-50, p_g-50, p_b-50)
	}	
}
