var argx, argy, argn, argl, arga, c, a, _dip, bb, i, aa;
argx = argument0
argy = argument1
argn = argument2
argl = argument3
arga = argument4
c = argument5
a = argument6
if (argn < 0)
{
    _dip = (1 - ((6 / argn) / argn))
    argn = (-2 * argn)
    draw_primitive_begin(4)
    bb = 1
    for (i = 0; i < (argn - 2); i++)
    {
        draw_vertex_color((argx + lengthdir_x((argl * _dip), arga)), (argy + lengthdir_y((argl * _dip), arga)), c, a)
        aa = ((i + 1) * (360 / argn))
        draw_vertex_color((argx + lengthdir_x((argl * bb), (arga + aa))), (argy + lengthdir_y((argl * bb), (arga + aa))), c, a)
        aa = ((i + 2) * (360 / argn))
        if (bb == 1)
            bb = _dip
        else
            bb = 1
        draw_vertex_color((argx + lengthdir_x((argl * bb), (arga + aa))), (argy + lengthdir_y((argl * bb), (arga + aa))), c, a)
    }
    draw_primitive_end()
}
else
{
    draw_primitive_begin(4)
    for (i = 0; i < (argn - 2); i++)
    {
        draw_vertex_color((argx + lengthdir_x(argl, arga)), (argy + lengthdir_y(argl, arga)), c, a)
        aa = ((i + 1) * (360 / argn))
        draw_vertex_color((argx + lengthdir_x(argl, (arga + aa))), (argy + lengthdir_y(argl, (arga + aa))), c, a)
        aa = ((i + 2) * (360 / argn))
        draw_vertex_color((argx + lengthdir_x(argl, (arga + aa))), (argy + lengthdir_y(argl, (arga + aa))), c, a)
    }
    draw_primitive_end()
}
