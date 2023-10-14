abreak = 0
AlreadyRanCollisions = 0
if (!(variable_instance_exists(id, "stepremaining")))
    stepremaining = 1
if (!(variable_instance_exists(id, "fade_out")))
    fade_out = 1
if (!(variable_instance_exists(id, "my_Size")))
    my_Size = 0
if (!(variable_instance_exists(id, "my_realSize")))
    my_realSize = my_Size
if (!(variable_instance_exists(id, "selfhit")))
    selfhit = 1
if (!(variable_instance_exists(id, "my_Density")))
    my_Density = 1
mass = ((1 + (my_Size * my_Size)) * my_Density)
my_Damp = (0.05 / sqrt(my_Density))
if (!(variable_instance_exists(id, "my_MaxSpeed")))
    my_MaxSpeed = 0
if (!(variable_instance_exists(id, "my_Shield")))
    my_Shield = 0
if (!(variable_instance_exists(id, "my_Recharge")))
    my_Recharge = 1
if (!(variable_instance_exists(id, "my_Damage")))
    my_Damage = 1
if (!(variable_instance_exists(id, "my_Resist")))
    my_Resist = 0
if (!(variable_instance_exists(id, "DamageEffects")))
    DamageEffects = 1
if (!(variable_instance_exists(id, "RatioEffects")))
    RatioEffects = 1
if (!(variable_instance_exists(id, "MotionEffects")))
    MotionEffects = 1
if (!(variable_instance_exists(id, "my_Penetration")))
    my_Penetration = 1
if (!(variable_instance_exists(id, "my_Pushability")))
    my_Pushability = 1
if (!(variable_instance_exists(id, "xaccel")))
    xaccel = 0
if (!(variable_instance_exists(id, "yaccel")))
    yaccel = 0
if (!(variable_instance_exists(id, "xspeed")))
    xspeed = xaccel
if (!(variable_instance_exists(id, "yspeed")))
    yspeed = yaccel
if (!(variable_instance_exists(id, "masterid")))
    masterid = id
if (!(variable_instance_exists(id, "my_Color")))
    my_Color = c_black
if (!(variable_instance_exists(id, "DRAWHEALTH")))
    DRAWHEALTH = 1
if (!(variable_instance_exists(id, "DRAWSHAPE")))
    DRAWSHAPE = ""
if (!(variable_instance_exists(id, "scorevalue")))
    scorevalue = 0
if (!(variable_instance_exists(id, "my_Stealth")))
    my_Stealth = 1
if (!(variable_instance_exists(id, "my_SetHealth")))
    my_SetHealth = 10
if (!(variable_instance_exists(id, "my_MaxHealth")))
{
    my_Health = my_SetHealth
    my_MaxHealth = my_SetHealth
    my_Ratio = 1
    DamageRecieved = 0
    DamageDealt = 0
}
else if (my_MaxHealth != my_SetHealth)
{
    if my_MaxHealth
        my_Health = ((my_Health / my_MaxHealth) * my_SetHealth)
    else
        my_Health = my_SetHealth
    my_MaxHealth = my_SetHealth
}
if (!(variable_instance_exists(id, "my_SetShield")))
    my_SetShield = 0
if (!(variable_instance_exists(id, "my_MaxShield")))
{
    my_Shield = my_SetShield
    my_MaxShield = my_SetShield
    my_ShieldRegen = (my_MaxShield / 60)
    shieldfactor = 0
}
else if (my_MaxShield != my_SetShield)
{
    if my_MaxShield
        my_Shield = ((my_Shield / my_MaxShield) * my_SetShield)
    else
        my_Shield = my_SetShield
    my_MaxShield = my_SetShield
}
if (!(variable_instance_exists(id, "CollisionArray")))
    CollisionArray = ds_list_create()
drawcolor = my_Color
drawdark = merge_color(my_Color, c_black, 0.4)
