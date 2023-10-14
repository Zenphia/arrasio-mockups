ANGLE += (1 / _food_level)
apply_acceleration(id, (0.01 / _food_level), (-ANGLE))
if entity_step()
{
    if (!(irandom((power(_food_level, 3) * 500))))
        food_upgrade()
    entity_draw()
}
