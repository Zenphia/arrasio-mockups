var N, position, settings, skills, Damage, Penetration, Speed, Strength, Resist, sizefactor, d, s, ss, sd, extraboost;
N = instance_create(argument0, argument1, argument2)
position = argument6
settings = argument7
skills = argument8
Damage = skills[0]
Penetration = skills[1]
Speed = skills[2]
Strength = skills[3]
Resist = skills[4]
sizefactor = (argument4 / 12)
N.my_Size = (((settings[3] * argument4) * argument5) / 20)
N.my_Resist = (1 - power(0.1, (settings[12] * Resist)))
N.my_SetHealth = ((settings[4] * Strength) + sizefactor)
N.my_Density = ((settings[10] * Penetration) / sizefactor)
N.my_Penetration = max(1, (settings[6] * Penetration))
N.my_Damage = ((settings[5] * Damage) * sqrt(sizefactor))
N.my_MaxSpeed = (settings[8] * Speed)
N.range = settings[9]
N.my_Color = merge_color(my_Color, $660A82, random(0.1))
N.masterid = id
N.my_Shield = 0
N.DRAWHEALTH = 0
d = argument3
s = (settings[7] * Speed)
do
{
    sd = gauss(0, (settings[11] * sqrt(settings[2])))
} until (abs(sd) <= (settings[11] / 2));
N.xspeed = ((s * (ss + 1)) * dcos((d + sd)))
N.yspeed = ((s * (ss + 1)) * (-(dsin((d + sd)))))
N.x += (N.xspeed * position)
N.y += (N.yspeed * position)
if (argument2 != 4)
{
    extraboost = ((((N.xspeed * xspeed) + (N.yspeed * yspeed)) / length(xspeed, yspeed)) / length(N.xspeed, N.yspeed))
    N.xspeed += (max(0, extraboost) * xspeed)
    N.yspeed += (max(0, extraboost) * yspeed)
}
N.xaccel = 0
N.yaccel = 0
with (N)
    entity_initalize()
switch argument2
{
    case 3:
        N.DamageEffects = 0
        N.RatioEffects = 0
        break
    case 5:
        N.my_Pushability = (1 / sqrt(Penetration))
        N.DRAWSHAPE = "star"
        N.my_MaxSpeed = 0
        N.ANGLE = irandom(360)
        break
    case 6:
        N.my_Pushability = (1 / sqrt(Penetration))
        N.DRAWSHAPE = "squarestar"
        N.ANGLE = irandom(360)
        N.target_dist = point_distance(x, y, mouse_x, mouse_y)
        break
    case 0:
        drone_count++
        N.my_Stealth = 0
        N.my_Penetration = max(1, (settings[6] * ((0.5 * (Penetration - 1)) + 1)))
        N.my_Density = ((settings[10] * ((10 * (Penetration - 1)) + 1)) / sizefactor)
        N.my_Health /= (settings[6] * Penetration)
        N.my_MaxHealth /= (settings[6] * Penetration)
        N.my_Damage *= (settings[6] * Penetration)
        N.my_Speed = N.my_MaxSpeed
        N.control = id
        N.DRAWSHAPE = "triangle"
        N.ANGLE = point_direction(0, 0, N.xspeed, N.yspeed)
        N.reporteddeath = 0
        N.MotionEffects = 0
        N.DamageEffects = 0
        N.RatioEffects = 0
        break
    case 1:
        N.my_Penetration = max(1, (settings[6] * ((0.5 * (Penetration - 1)) + 1)))
        N.my_Health /= (settings[6] * Penetration)
        N.my_MaxHealth /= (settings[6] * Penetration)
        N.control = id
        N.my_Speed = N.my_MaxSpeed
        N.DRAWSHAPE = "triangle"
        N.ANGLE = point_direction(0, 0, N.xspeed, N.yspeed)
        break
}

with (N)
    entity_initalize()
