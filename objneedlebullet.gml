// create

path = path_add()
spd = 4

// begin step

image_angle = direction

// step

var _groundenemy = instance_nearest(x, y, objsmartgroundenemy)
var _flyingenemy = instance_nearest(x, y, objflyingenemy)
if (instance_exists(objsmartgroundenemy) && distance_to_object(_flyingenemy) > distance_to_object(_groundenemy))
{
    mp_grid_path(global.grid, path, x, y, _groundenemy.x, (_groundenemy.y - 20), true)
    path_start(path, spd, path_action_stop, 0)
}
else if (distance_to_object(_flyingenemy) < distance_to_object(_groundenemy))
{
    mp_grid_path(global.grid, path, x, y, _flyingenemy.x, _flyingenemy.y, true)
    path_start(path, spd, path_action_stop, 0)
}
if (instance_exists(objflyingenemy) && distance_to_object(_groundenemy) > distance_to_object(_flyingenemy))
{
    mp_grid_path(global.grid, path, x, y, _flyingenemy.x, _flyingenemy.y, true)
    path_start(path, spd, path_action_stop, 0)
}
else if (distance_to_object(_groundenemy) < distance_to_object(_flyingenemy))
{
    mp_grid_path(global.grid, path, x, y, _groundenemy.x, (_groundenemy.y - 20), true)
    path_start(path, spd, path_action_stop, 0)
}
if ((!instance_exists(objsmartgroundenemy)) || (!instance_exists(objflyingenemy)))
{
    speed = 4
    direction = other.image_angle
    image_angle = direction
}

// collision

with (other.id)
{
    hp--
    flash = 3
    hitfrom = other.direction
}
instance_destroy()

// draw

if place_meeting(x, y, objwall)
{
    part_particles_create(global.P_System, x, y, global.Particle29, 1)
    instance_destroy()
}
part_particles_create(global.P_System, x, y, global.Particle22, 1)
