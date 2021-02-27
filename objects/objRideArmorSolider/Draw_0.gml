event_inherited()
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_rectangle_color(x, bbox_top, x + image_xscale * 64, bbox_bottom, c_red, c_red, c_red, c_red, true);