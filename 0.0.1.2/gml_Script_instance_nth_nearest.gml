var pointx, pointy, object, n, list, nearest;
pointx = argument0
pointy = argument1
object = argument2
n = argument3
n = min(max(1, n), instance_number(object))
list = ds_priority_create()
nearest = -4
with (object)
    ds_priority_add(list, id, point_distance(x, y, pointx, pointy))
repeat n
    nearest = ds_priority_delete_min(list)
ds_priority_destroy(list)
return nearest;
