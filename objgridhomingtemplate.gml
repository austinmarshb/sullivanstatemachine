// create

speed = 4

// step

part_particles_create(global.P_System, x, y, global.Particle17, 1)
move_towards_point(objplayer.x, objplayer.y, 1.5)
direction = point_direction(x, y, objplayer.x, ((objplayer.y - (objplayer.sprite_height / 2)) - 5))
image_angle = direction

// collision

instance_create_layer(x, y, "Bullet_Layer", objenemygrenadeHITBOX)
part_particles_create(global.P_System, x, y, global.Particle8, 1)
part_particles_create(global.P_System, x, y, global.Particle10, 1)
audio_play_sound(lizardgrenade, 2, false)
instance_destroy()

// draw

if place_meeting(x, y, objwall)
{
    instance_create_layer(x, y, "Bullet_Layer", objenemygrenadeHITBOX)
    part_particles_create(global.P_System, x, y, global.Particle8, 1)
    part_particles_create(global.P_System, x, y, global.Particle10, 1)
    audio_play_sound(lizardgrenade, 2, false)
    instance_destroy()
}