var o;
my_MaxSpeed = 0
event_inherited()
o = instance_nearest(x, y, PlayerShooter)
if (instance_distance(o, id) < (o.my_Size + (my_Size * 2)))
{
    x = -1000
    y = -1000
    my_health = 0
}
