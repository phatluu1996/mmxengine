top = instance_create_depth(x, y, depth - 1, objTopBorder);
top.image_xscale = image_xscale;

down = instance_create_depth(x, y + sprite_height , depth - 1, objBottomBorder);
down.image_xscale = image_xscale;

left = instance_create_depth(x, y, depth - 1, objLeftBorder);
left.image_yscale = image_yscale;

right = instance_create_depth(x + sprite_width, y, depth - 1, objRightBorder);
right.image_yscale = image_yscale;
