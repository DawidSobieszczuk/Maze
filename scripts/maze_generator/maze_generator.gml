///@param width
///@param height
///@return ds_grid
randomize();

var width = argument0;
var height = argument1;
var grid = ds_grid_create(width, height);
var start_point = [];
var end_point = [];

var _visited = [];
var _stack = ds_stack_create();
var _neighbours = [];
var _nlength = 0;
var _current = 0;
var _next = 0;
var _r = 0;
var _length = width * height;

for(var i = 0; i < _length; i++) {
	_visited[i] = false;
	
	var _x = get_x(i, width);
	var _y = get_y(i, width);
	
	ds_grid_set(grid, _x, _y, wall_top | wall_bottom | wall_left | wall_right);
}

// STEP 1
_current = irandom(_length-1);
_visited[_current] = true;

start_point = [_current % width, floor(_current/height)];

// STEP 2
do {
	_neighbours = maze_get_neighbours(_current, _visited, width, height);
	_nlength = array_length_1d(_neighbours);
	if(_nlength > 0) {
		_r = irandom(_nlength-1);
		_next = _neighbours[_r];
		_visited[_next] = true;
		
		ds_stack_push(_stack, _current);
		
		// Remove walls
		var _cx = get_x(_current, width);
		var _cy = get_y(_current, width);
		var _nx = get_x(_next, width);
		var _ny = get_y(_next, width);
		
		var _gc = ds_grid_get(grid, _cx, _cy);
		var _gn = ds_grid_get(grid, _nx, _ny);		
		
		var _x = _cx - _nx;
		
		if(_x < 0) {
			ds_grid_set(grid, _cx, _cy, _gc ^ wall_right);
			ds_grid_set(grid, _nx, _ny, _gn ^ wall_left);
		} else if(_x > 0) {
			ds_grid_set(grid, _cx, _cy, _gc ^ wall_left);
			ds_grid_set(grid, _nx, _ny, _gn ^ wall_right);
		}
		var _y = _cy - _ny;
		if(_y > 0) {
			ds_grid_set(grid, _cx, _cy, _gc ^ wall_top);
			ds_grid_set(grid, _nx, _ny, _gn ^ wall_bottom);
		} else if(_y < 0) {
			ds_grid_set(grid, _cx, _cy, _gc ^ wall_bottom);
			ds_grid_set(grid, _nx, _ny, _gn ^ wall_top);
		}
		
		_current = _next;		
	} else {
		_current = ds_stack_pop(_stack);	
	}	
} until(ds_stack_empty(_stack));

end_point = [_next % width, floor(_current/height)]

return grid;