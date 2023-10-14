var cof, i, j, AbA, bAb, attrib;
cof = 0.5
for (i = 0; i < 5; i++)
{
    j = 0
    repeat (2)
    {
        AbA = (((i + 2) % 5) + j)
        bAb = (((i + 4) % 5) + j)
        attrib[(i + j)] = skill[(i + j)]
        attrib[(i + j)] += (((1 - power(abs(((skill[AbA] / 10) - 1)), 1.5)) * skill[AbA]) * 0.2)
        attrib[(i + j)] -= ((power((skill[bAb] / 10), 1.5) * skill[bAb]) * 0.2)
        attrib[(i + j)] /= 10
        j = 5
    }
}
stat_Reload = power(0.4, attrib[0])
stat_Penetration = (1 + (2 * attrib[1]))
stat_Strength = (1 + (4 * max(0, attrib[2])))
stat_Damage = (1 + (3 * attrib[3]))
stat_Speed = (1 + (1.5 * attrib[4]))
stat_BulletResist = attrib[1]
stat_Shield = power(8, attrib[5])
stat_Attack = (1 + (3 * attrib[6]))
stat_Health = power(10, attrib[7])
stat_Mobility = (1 + (1.25 * attrib[8]))
stat_Regeneration = (1 + (5 * attrib[9]))
