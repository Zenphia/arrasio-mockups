var n, t;
n = other.id
if (masterid == n.masterid)
{
    t = point_direction((x + xspeed), (y + yspeed), (n.x + n.xspeed), (n.y + n.yspeed))
    do
    {
        xspeed -= (0.01 * dcos(t))
        yspeed += (0.01 * dsin(t))
    } until (point_distance((x + xspeed), (y + yspeed), (n.x + n.xspeed), (n.y + n.yspeed)) > ((my_Size * 1.5) + (n.my_Size * 1.5)) || length(xspeed, yspeed) > my_Speed);
}
