var argx, argy, argn, argl, arga, c, a, i, aa;
argx = argument0
argy = argument1
argn = argument2
argl = argument3
arga = argument4
c = argument5
a = argument6
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
