var up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));

hmove = (right - left);
vmove = (down - up);

if((hmove != 0 || vmove != 0) && !is_moving) {
	var walls = ds_grid_get(o_maze.grid, floor(x / cell_size), floor(y / cell_size)); 
	if(hmove > 0 && (walls & wall_right) == 0) {
		to_x += cell_size;
		is_moving = true;
		time_started_moving = current_time;
		
	}else if(hmove < 0 && (walls & wall_left) == 0) {
		to_x -= cell_size;
		is_moving = true;
		time_started_moving = current_time;
	} else if(vmove > 0 && (walls & wall_bottom) == 0) {
		to_y += cell_size;
		is_moving = true;
		time_started_moving = current_time;
	} else if(vmove < 0 && (walls & wall_top) == 0) {
		to_y -= cell_size;
		is_moving = true;
		time_started_moving = current_time;
	}
}

if(is_moving) {
	var time = current_time - time_started_moving;
	var percent = clamp(time / move_time, 0, 1);
	
	x = lerp(from_x, to_x, percent);
	y = lerp(from_y, to_y, percent);
	if(percent >= 1) {
		from_x = x;
		from_y = y;
		is_moving = false;
	}	
}