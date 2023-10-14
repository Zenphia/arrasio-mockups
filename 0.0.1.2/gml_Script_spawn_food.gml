var xplace, yplace, reps, scatter, level, o, mitosis;
xplace = argument0
yplace = argument1
reps = (irandom((ceil(argument2) - 1)) + 1)
scatter = argument3
level = argument4
switch argument4
{
    case 0:
        repeat reps
        {
            if (xplace < 0 || yplace < 0 || xplace > room_width || yplace > room_height)
                break
            else
            {
                o = instance_nearest(xplace, yplace, Foodstuffs)
                with (o)
                    food_upgrade()
                xplace += gauss(0, (scatter * 2))
                yplace += gauss(0, (scatter * 2))
            }
        }
        break
    default:
        repeat reps
        {
            if (xplace < 0 || yplace < 0 || xplace > room_width || yplace > room_height)
                break
            else
            {
                o = instance_nearest(xplace, yplace, Foodstuffs)
                mitosis = 0
                if (o != noone)
                {
                    if (point_distance(xplace, yplace, o.x, o.y) < scatter)
                    {
                        if (!(irandom(sqr((o._food_level - 1)))))
                            mitosis = 1
                    }
                }
                if mitosis
                {
                    if check_in_view(xplace, yplace, o.my_realSize)
                        split_new_food(o.x, o.y, o.my_realSize, o.ANGLE, o._food_level)
                    else
                        place_new_food(o.x, o.y, (o.my_realSize * 2), o._food_level)
                }
                else
                    place_new_food(xplace, yplace, scatter, level)
                xplace += gauss(0, (scatter * 2))
                yplace += gauss(0, (scatter * 2))
            }
        }
}

