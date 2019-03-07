randomize();

width = irandom_range(10, 50);
height = irandom_range(10,50);

room_width = width * cell_size;
room_height = height * cell_size;

grid = maze_generator(width,height);
var _start = [floor(width/2), floor(height/2)];
var _end = [0,0];
switch(irandom(3)) {
	case 0: 
		_end[0] = irandom(width-1);
		_end[1] = 0;
		break;
	case 1: 
		_end[0] = irandom(width-1);
		_end[1] = height-1;
		break;
	case 2: 
		_end[0] = width-1;
		_end[1] = irandom(height-1);
		break;
	case 3: 
		_end[0] = 0;
		_end[1] = irandom(height-1);
		break;
}

instance_create_layer(_start[0]*cell_size+cell_size/2, _start[1]*cell_size+cell_size/2, layer, o_player);
instance_create_layer(_end[0]*cell_size+cell_size/2, _end[1]*cell_size+cell_size/2, layer, o_end);
