///@param current
///@param visited

var current = argument0;
var visited = argument1;
var width = argument2;
var height = argument3;
var neighbours = []; // return
var _i = 0;

var _x = get_x(current, width);
var _y = get_y(current, width);

var _indexes = [
	get_index(_x, _y + 1, width, height), 
	get_index(_x, _y - 1,  width, height), 
	get_index(_x - 1, _y,  width, height), 
	get_index(_x + 1, _y,  width, height)
];

for(var i = 0; i < 4; i++) {
	var _index = _indexes[i];
	if(_index != -1) if(!visited[_index]) neighbours[_i++] = _index;
}

return neighbours;