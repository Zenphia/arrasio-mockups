var l, desiredxspeed, desiredyspeed;
target_active = control.target_active
if (target_active == 1)
{
    target_x = control.target_x
    target_y = control.target_y
    action = -1
}
else
{
    target_active = 0
    target_x = x
    target_y = y
}
l = length((x - target_x), (y - target_y))
if (l < my_Size)
    target_active = 0
if target_active
{
    my_MaxSpeed = my_Speed
    desiredxspeed = (((action * my_MaxSpeed) * (x - target_x)) / l)
    desiredyspeed = (((action * my_MaxSpeed) * (y - target_y)) / l)
    xaccel += ((desiredxspeed - xspeed) / sqrt(max(1, (my_Speed * range))))
    yaccel += ((desiredyspeed - yspeed) / sqrt(max(1, (my_Speed * range))))
}
ANGLE = point_direction(0, 0, xspeed, yspeed)
