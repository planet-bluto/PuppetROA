// dash-attack fx

if ("dash_fx_frames" not in self) {
	dash_fx_frames = 12
}

if (attack == AT_DATTACK and (window == 1 && window_timer == 13)) {
	dash_fx_frames = 0
	dash_fx_x = x-54*spr_dir
	dash_fx_y = y-54
}
if (dash_fx_frames < 12) {
	switch (get_player_color(player)) {
		case 6:
			draw_sprite_ext(sprite_get("fx_dattack_log"), dash_fx_frames/4, dash_fx_x, dash_fx_y, spr_dir, 1, 0, color, 1)
		break;
		default:
			shader_start()
			draw_sprite_ext(sprite_get("fx_dattack"), dash_fx_frames/4, dash_fx_x, dash_fx_y, spr_dir, 1, 0, c_white, 1)
			shader_end()
	}
}

dash_fx_frames += (dash_fx_frames < 12 ? 1 : 0)