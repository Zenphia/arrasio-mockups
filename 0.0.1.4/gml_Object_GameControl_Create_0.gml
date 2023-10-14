randomize()
masterid = id
MINIMAP = ds_map_create()
init_stats()
rotation = 0
view_enabled = true
view_visible[0] = true
view_wport[0] = 2000
view_hport[0] = 1200
window_set_rectangle(((display_get_width() - (view_wport[0] * 0.5)) * 0.5), ((display_get_height() - (view_hport[0] * 0.5)) * 0.5), (view_wport[0] / 2), (view_hport[0] / 2))
surface_resize(application_surface, view_wport[0], view_hport[0])
view_wview[0] = 1000
view_hview[0] = 600
TARGET = instance_create(irandom(room_width), irandom(room_height), PlayerShooter)
with (TARGET)
    entity_initalize()
