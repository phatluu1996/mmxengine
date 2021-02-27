// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_shader_draw(){
	shader_set(sh_replace_color);	
	shader_set_uniform_f(sh_handle_range, 1);
	
	for (var i = 0; i < color_palete_lenght; ++i) {
	    shader_set_uniform_f(sh_handle_match[i], 
			colorMatch[i].toShaderValue(colorMatch[i].red),
			colorMatch[i].toShaderValue(colorMatch[i].green),
			colorMatch[i].toShaderValue(colorMatch[i].blue));
	
		shader_set_uniform_f(sh_handle_replace[i], 
			colorReplace[i].toShaderValue(colorReplace[i].red),
			colorReplace[i].toShaderValue(colorReplace[i].green),
			colorReplace[i].toShaderValue(colorReplace[i].blue));	
	}
}