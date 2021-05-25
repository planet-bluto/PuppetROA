// dash-attack fx

if (attack == AT_DATTACK and (window == 1 && window_timer == 13)) {
	draw_hit_fx("fx_dattack", -54, -54, 12, 4)
}

if ( attack_hit[AT_DATTACK,1] ) {
	attack_hit[AT_DATTACK,1] = false
	draw_hit_fx("fx_hit1", 19, -43, 18, 0.5)
}

for (var i = 0; i < ds_list_size(active_dashfx); i += 1) {
		var curr_dashfx = ds_list_find_value(active_dashfx, i)
		curr_dashfx.frames += 1
		if (curr_dashfx.frames != curr_dashfx.anim_length) {
			switch (get_player_color(player)) {
				case 6:
					draw_sprite_ext(curr_dashfx.sprite, curr_dashfx.frames/curr_dashfx.fx_fps, curr_dashfx.x_offset, curr_dashfx.y_offset, spr_dir, 1, 0, color, 1)
				break;
				default:
					shader_start()
					draw_sprite_ext(curr_dashfx.sprite, curr_dashfx.frames/curr_dashfx.fx_fps, curr_dashfx.x_offset, curr_dashfx.y_offset, spr_dir, 1, 0, c_white, 1)
					shader_end()
			}
		} else {
			ds_list_delete(active_dashfx, i)
		}
}

#define draw_hit_fx(_sprite, _x_offset, _y_offset, _anim_length, _fps)
	to_return = {
		x_offset: x+_x_offset*spr_dir,
		y_offset: y+_y_offset,
		dir: spr_dir,
		sprite: sprite_get(_sprite + alt_suffix),
		frames: 0,
		fx_fps: _fps,
		anim_length: _anim_length
	}
	ds_list_add(active_dashfx, to_return)