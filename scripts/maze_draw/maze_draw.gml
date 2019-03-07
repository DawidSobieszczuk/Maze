var grid = argument0;

var _width = ds_grid_width(grid);
var _height = ds_grid_height(grid);

for(var _x = 0; _x < _width; _x++) {
	for(var _y = 0; _y < _height; _y++) {
		maze_draw_walls(_x, _y, ds_grid_get(grid, _x, _y));
	}
}

