var pointx, pointy, object, n, range, list, nearest, d;
pointx = argument0
pointy = argument1
object = argument2
n = argument3
range = (argument4 + my_realSize)
n = min(max(1, n), instance_number(object))
list = ds_priority_create()
nearest = -4
with (object)
{
    d = (distance_to_point(pointx, pointy) - my_realSize)
    if (d <= range)
        ds_priority_add(list, id, distance_to_point(pointx, pointy))
}
repeat n
    nearest = ds_priority_delete_min(list)
ds_priority_destroy(list)
return nearest;
