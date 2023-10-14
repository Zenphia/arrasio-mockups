if (point_distance(xstart, ystart, x, y) > (target_dist - (my_Size * 3)))
{
    my_MaxSpeed = 0
    my_Damp = 0.15
}
ANGLE += length(xspeed, yspeed)
if (range < 0)
    my_Health -= get_health_damage(1, my_MaxHealth, my_Resist)
range -= 1
