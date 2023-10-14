var vpos_w, vpos_h;
if instance_exists(TARGET)
{
    vpos_w = (view_wview[0] / 2)
    vpos_h = (view_hview[0] / 2)
    view_xview[0] = (TARGET.x - vpos_w)
    view_yview[0] = (TARGET.y - vpos_h)
    displayed_score = (TARGET.scorevalue - TARGET.skilldeduction)
    displayed_score_level = get_level(TARGET.skilllevel)
}
make_food()
