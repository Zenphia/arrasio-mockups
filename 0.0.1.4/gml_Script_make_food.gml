var W, H, _A, _B, n;
W = room_width
H = room_height
_A = ((room_width * room_height) / 100000000)
_B = sqrt(_A)
n = (instance_number(Foodstuffs) / _A)
if (n < 5000)
{
    if (irandom(n) < 10)
        spawn_food(gauss((W / 2), (W / 50)), gauss((H / 2), (H / 50)), (3 * _A), (20 * _B), 4)
    if (irandom(n) < 10)
        spawn_food(gauss((W / 2), (W / 3)), gauss((H / 2), (H / 3)), (50 * _A), (25 * _B), 1)
    if (irandom(n) < 10)
        spawn_food(gauss((W / 2), (W / 2)), gauss((H / 2), (H / 2)), (50 * _A), (200 * _B), 1)
    spawn_food(irandom(W), irandom(H), (10 * _A), (2000 * _B), 1)
}
if (irandom(n) < 100)
    spawn_food(gauss((W / 2), (W / 100)), gauss((H / 2), (H / 100)), (5 * _A), (50 * _B), 0)
if (irandom(n) < 50)
    spawn_food(irandom(W), irandom(H), (40 * _A), (2000 * _B), 0)
