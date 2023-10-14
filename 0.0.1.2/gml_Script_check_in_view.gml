var xx, yy, size, vpos_x, vpos_y, vpos_w, vpos_h;
xx = argument0
yy = argument1
size = argument2
vpos_x = view_xview[0]
vpos_y = view_yview[0]
vpos_w = view_wview[0]
vpos_h = view_hview[0]
if (!((abs(((xx - vpos_w) - vpos_x)) < (vpos_w + (size * 2)) && abs(((yy - vpos_h) - vpos_y)) < (vpos_h + (size * 2)))))
    return 0;
return 1;
