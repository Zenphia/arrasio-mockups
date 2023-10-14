if (!entity_collide())
{
    if (length(xspeed, yspeed) < (my_MaxSpeed / 2) || range < 0)
        my_Health -= get_health_damage(1, my_MaxHealth, my_Resist)
}
range -= 1
