// dash-attack fx

if (attack == AT_DATTACK and (window == 1 && window_timer == 13)) {
	draw_hit_fx("fx_dattack", -54, -54, 12, 4)
}

if (attack == AT_DATTACK and (window == 1 && window_timer == 1)) {
	datk_htfx2[0] = "fx_hit2"
	datk_htfx2[1] = 19
	datk_htfx2[2] = -43
	datk_htfx2[3] = 25
	datk_htfx2[4] = 1.2
	datk_htfx2[5] = spr_dir
}

if ( attack_hit[AT_DATTACK,1] ) {
	attack_hit[AT_DATTACK,1] = false
	draw_hit_fx_dir(
		datk_htfx2[0],
		datk_htfx2[1],
		datk_htfx2[2],
		datk_htfx2[3],
		datk_htfx2[4],
		datk_htfx2[5]
	 )
}

for (var i = 0; i < ds_list_size(active_dashfx); i += 1) {
		var curr_dashfx = ds_list_find_value(active_dashfx, i)
		curr_dashfx.frames += 1
		if (curr_dashfx.frames != curr_dashfx.anim_length) {
			switch (get_player_color(player)) {
				case 6:
					draw_sprite_ext(curr_dashfx.sprite, curr_dashfx.frames/curr_dashfx.fx_fps, curr_dashfx.x_offset, curr_dashfx.y_offset, curr_dashfx.dir, 1, 0, color, 1)
				break;
				default:
					shader_start()
					draw_sprite_ext(curr_dashfx.sprite, curr_dashfx.frames/curr_dashfx.fx_fps, curr_dashfx.x_offset, curr_dashfx.y_offset, curr_dashfx.dir, 1, 0, c_white, 1)
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

#define draw_hit_fx_dir(_sprite, _x_offset, _y_offset, _anim_length, _fps, _dir)
	to_return = {
		x_offset: x+_x_offset*_dir,
		y_offset: y+_y_offset,
		dir: _dir,
		sprite: sprite_get(_sprite + alt_suffix),
		frames: 0,
		fx_fps: _fps,
		anim_length: _anim_length
	}
	ds_list_add(active_dashfx, to_return)