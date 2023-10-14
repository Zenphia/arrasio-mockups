var argx, argy, argl, aa, c, a, r1, r2, l1, l2;
argx = argument0
argy = argument1
argl = (argument2 / 2)
argh2 = (argument3 / 2)
argh1 = (argument4 / 2)
aa = argument5
c = argument6
a = argument7
r1 = point_direction(0, 0, argl, argh1)
r2 = point_direction(0, 0, argl, argh2)
l1 = length(argl, argh1)
l2 = length(argl, argh2)
draw_primitive_begin(4)
draw_vertex_color((argx + lengthdir_x(l1, (aa + r1))), (argy + lengthdir_y(l1, (aa + r1))), c, a)
draw_vertex_color((argx + lengthdir_x(l2, ((aa + 180) - r2))), (argy + lengthdir_y(l2, ((aa + 180) - r2))), c, a)
draw_vertex_color((argx + lengthdir_x(l2, ((aa + 180) + r2))), (argy + lengthdir_y(l2, ((aa + 180) + r2))), c, a)
draw_vertex_color((argx + lengthdir_x(l2, ((aa + 180) + r2))), (argy + lengthdir_y(l2, ((aa + 180) + r2))), c, a)
draw_vertex_color((argx + lengthdir_x(l1, (aa - r1))), (argy + lengthdir_y(l1, (aa - r1))), c, a)
draw_vertex_color((argx + lengthdir_x(l1, (aa + r1))), (argy + lengthdir_y(l1, (aa + r1))), c, a)
draw_primitive_end()
