var n, dist, dir, l, desiredxspeed, desiredyspeed;
target_active = control.target_active
if (target_active == 1)
{
    target_x = control.target_x
    target_y = control.target_y
    action = -1
}
else if (target_active == 2)
{
    target_x = control.target_x
    target_y = control.target_y
    action = 1
}
else
{
    n = instance_nearest(x, y, Foodstuffs)
    dist = point_distance(n.x, n.y, control.x, control.y)
    if (dist < range)
    {
        target_x = n.x
        target_y = n.y
        action = -1
        target_active = 1
    }
    else
    {
        dir = point_direction(control.x, control.y, x, y)
        target_x = (control.x + ((control.my_Size * 3) * dcos(dir)))
        target_y = (control.y - ((control.my_Size * 3) * dsin(dir)))
        action = -1
        target_active = 1
    }
}
l = length((x - target_x), (y - target_y))
if (l < my_Size)
    target_active = 0
if target_active
{
    my_MaxSpeed = my_Speed
    desiredxspeed = (((action * my_MaxSpeed) * (x - target_x)) / l)
    desiredyspeed = (((action * my_MaxSpeed) * (y - target_y)) / l)
    xaccel += ((desiredxspeed - xspeed) / 20)
    yaccel += ((desiredyspeed - yspeed) / 20)
}
else
    my_MaxSpeed = 0
if (length((x - target_x), (y - target_y)) && length(xspeed, yspeed))
{
    if (action == 1)
        offset = 180
    else
        offset = 0
    ANGLE += loop_smooth(ANGLE, (offset + point_direction(x, y, target_x, target_y)), 5)
}
if ((!reporteddeath) && my_Health <= 0)
{
    control.drone_count--
    reporteddeath = 1
}
