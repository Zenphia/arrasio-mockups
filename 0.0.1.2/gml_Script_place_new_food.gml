var xplace, yplace, scatter, level, attempts_remaining, o;
xplace = argument0
yplace = argument1
scatter = argument2
level = argument3
attempts_remaining = 20
repeat attempts_remaining
{
    xplace += gauss(0, (scatter * 2))
    yplace += gauss(0, (scatter * 2))
    o = instance_nearest(xplace, yplace, Foodstuffs)
    if (o == noone)
        break
    else if (point_distance(xplace, yplace, o.x, o.y) > scatter)
    {
    }
    else
        attempts_remaining -= 1
}
if (!attempts_remaining)
{
    with (o)
        food_upgrade()
    exit
}
if (xplace < 0 || yplace < 0 || xplace > room_width || yplace > room_height)
    exit
o = instance_create(xplace, yplace, Foodstuffs)
o.ANGLE = irandom(360)
o.masterid = masterid
with (o)
{
    food_define(level)
    apply_acceleration(id, (1 / sqr(level)), irandom(360))
    entity_initalize()
}
