switch argument0
{
    case 1:
        DRAWSHAPE = "circle"
        my_Size = 5
        my_Color = merge_color($888888, c_white, random_range(0.2, 0.4))
        my_SetHealth = 0.0011
        my_Damage = 0
        DamageEffects = 0
        RatioEffects = 0
        my_Density = 1
        scorevalue = 5
        my_Pushability = 0
        my_Stealth = 100
        DRAWHEALTH = 0
        break
    case 2:
        DRAWSHAPE = "square"
        my_Size = 10
        my_Color = merge_color($15A0DB, $1B15C4, random(0.25))
        my_SetHealth = 1.5
        my_Damage = 1
        DamageEffects = 0
        RatioEffects = 0
        my_Density = 2
        scorevalue = 10
        my_Pushability = 1
        DRAWHEALTH = 1
        break
    case 3:
        DRAWSHAPE = "triangle"
        my_Size = 10
        my_Color = merge_color($1B15C4, $D66633, random(0.15))
        my_SetHealth = 8
        my_Resist = 0.15
        my_Damage = 1.5
        DamageEffects = 0
        RatioEffects = 0
        my_Density = 3
        scorevalue = 35
        break
    case 4:
        DRAWSHAPE = "pentagon"
        my_Size = 16
        my_Color = merge_color($660A82, $1B15C4, random(0.2))
        my_SetHealth = 25
        my_Resist = combine_resist(0.15, 0.15, 1)
        my_Damage = 3
        DamageEffects = 0
        RatioEffects = 0
        my_Density = 4
        scorevalue = 150
        break
    case 5:
        DRAWSHAPE = "pentagon"
        my_Size = 24
        my_Color = merge_color($660A82, $1B15C4, random(0.2))
        my_SetHealth = 90
        my_Resist = combine_resist(0.15, 0.15, 2)
        my_Damage = 4
        DamageEffects = 0
        RatioEffects = 0
        my_Density = 5
        my_SetShield = 90
        my_ShieldRegen = 1
        scorevalue = 750
        break
    case 6:
        DRAWSHAPE = "pentagon"
        my_Size = 36
        my_Color = merge_color($660A82, $1B15C4, random(0.2))
        my_SetHealth = 500
        my_Resist = combine_resist(0.15, 0.15, 3)
        my_Damage = 5
        DamageEffects = 0
        RatioEffects = 0
        my_Density = 6
        my_SetShield = 500
        my_ShieldRegen = 2
        scorevalue = 3500
        break
}

_food_upgrade_countup = 0
_food_level = argument0
entity_initalize()
