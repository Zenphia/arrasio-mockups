var expansion, alphaconstant;
if (!(check_in_view(x, y, my_Size)))
    exit
expansion = 1
if (fade_out != 1)
    expansion = (1 + ((1 - fade_out) / 4))
alphaconstant = fade_out
drawdark = merge_color(drawcolor, c_black, 0.4)
switch DRAWSHAPE
{
    case "triangle":
        my_realSize = ((my_Size * 1.555) * expansion)
        draw_rotated_ngon(x, y, 3, (my_realSize + 4), ANGLE, drawdark, (alphaconstant * alphaconstant))
        draw_rotated_ngon(x, y, 3, my_realSize, ANGLE, drawcolor, alphaconstant)
        break
    case "star":
        my_realSize = ((my_Size * 1.555) * expansion)
        draw_rotated_ngon(x, y, -3, (my_realSize + 4), ANGLE, drawdark, (alphaconstant * alphaconstant))
        draw_rotated_ngon(x, y, -3, my_realSize, ANGLE, drawcolor, alphaconstant)
        break
    case "square":
        my_realSize = ((my_Size * 1.253) * expansion)
        draw_rotated_ngon(x, y, 4, (my_realSize + 2.828), ANGLE, drawdark, alphaconstant)
        draw_rotated_ngon(x, y, 4, my_realSize, ANGLE, drawcolor, alphaconstant)
        break
    case "squarestar":
        my_realSize = ((my_Size * 1.253) * expansion)
        draw_rotated_ngon(x, y, -4, (my_realSize + 4), ANGLE, drawdark, (alphaconstant * alphaconstant))
        draw_rotated_ngon(x, y, -4, my_realSize, ANGLE, drawcolor, alphaconstant)
        break
    case "pentagon":
        my_realSize = ((my_Size * 1.149) * expansion)
        draw_rotated_ngon(x, y, 5, (my_realSize + 2.308), ANGLE, drawdark, alphaconstant)
        draw_rotated_ngon(x, y, 5, my_realSize, ANGLE, drawcolor, alphaconstant)
        break
    default:
        my_realSize = my_Size
        draw_set_alpha(alphaconstant)
        draw_set_color(drawdark)
        draw_circle(x, y, (my_Size + 2), 0)
        draw_set_color(drawcolor)
        draw_circle(x, y, my_Size, 0)
        break
}

image_xscale = ((my_realSize + 5) / 64)
image_yscale = ((my_realSize + 5) / 64)
if (fade_out == 1)
    drawcolor = merge_color(drawcolor, my_Color, 0.1)
