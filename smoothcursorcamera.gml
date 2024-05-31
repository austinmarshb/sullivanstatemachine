// create

movetowards = 0
goback = 0
cam = view_camera[0]
follow = 0
view_w_half = (camera_get_view_width(cam) * 0.5)
view_h_half = (camera_get_view_height(cam) * 0.5)
shake_length = 0
shake_magnitude = 0
shake_remain = 0
buff = 32

// step

move_towards_point(mouse_x, mouse_y, 0)
var xTo = (objplayer.x + lengthdir_x(min(96, distance_to_point(mouse_x, mouse_y)), direction))
var yTo = (objplayer.y + lengthdir_y(min(96, distance_to_point(mouse_x, mouse_y)), direction))
x += ((xTo - x) / 25)
y += ((yTo - y) / 25)
camera_set_view_pos(cam, (x - view_w_half), (y - view_h_half))
x += random_range((-shake_remain), shake_remain)
y += random_range((-shake_remain), shake_remain)
shake_remain = max(0, (shake_remain - ((1 / shake_length) * shake_magnitude)))