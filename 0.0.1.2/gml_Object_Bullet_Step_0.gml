if (!entity_collide())
{
    if (length(xspeed, yspeed) < (my_MaxSpeed / 2) || ticktock > range)
        my_Health -= get_health_damage(1, my_MaxHealth, my_Resist)
}
ticktock += 1
