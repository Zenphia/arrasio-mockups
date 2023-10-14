var n, t;
n = other.id
t = point_direction(x, y, n.x, n.y)
apply_acceleration(id, -0.02, t)
apply_acceleration(n, 0.02, t)
