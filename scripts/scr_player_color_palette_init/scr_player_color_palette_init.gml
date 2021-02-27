function scr_player_color_palette_init(){
	sh_handle_range = shader_get_uniform(sh_replace_color, "range");	
	color_palete_lenght = array_length(colorReplace);
	for (var i = 0; i < color_palete_lenght; ++i) {
		sh_handle_match[i] = shader_get_uniform(sh_replace_color, "colorMatch"+string(i));
		sh_handle_replace[i] = shader_get_uniform(sh_replace_color, "colorReplace"+string(i));    
	}
}