event_inherited();
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_rectangle_color(x + image_xscale * 32, bbox_top - 64, x + image_xscale * 64, bbox_bottom + 64, c_white, c_white, c_white, c_white, true);