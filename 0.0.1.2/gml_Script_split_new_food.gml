var X, Y, S, A, L, o;
X = argument0
Y = argument1
S = argument2
A = argument3
L = argument4
o = instance_create((X + lengthdir_x(S, A)), (Y + lengthdir_y(S, A)), Foodstuffs)
with (o)
{
    food_define(L)
    entity_initalize()
}
o.ANGLE = (A + irandom_range(90, 180))
o.masterid = masterid
