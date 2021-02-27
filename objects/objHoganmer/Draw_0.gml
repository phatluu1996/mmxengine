event_inherited()
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_rectangle_color(x + image_xscale * 160, bbox_top - 64, x, bbox_bottom + 64, c_green, c_green, c_green, c_green, true);