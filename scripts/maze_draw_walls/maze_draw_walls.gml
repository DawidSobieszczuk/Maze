var __x = argument0 * cell_size + cell_size * .5;
var __y = argument1 * cell_size + cell_size * .5;
var __walls = argument2;

var _hsize = cell_size * .5;

draw_set_color(c_black);
if(__walls & wall_top) {
	draw_line(__x - _hsize, __y - _hsize, __x + _hsize, __y - _hsize);
}

if(__walls & wall_bottom) {
	draw_line(__x - _hsize, __y + _hsize, __x + _hsize, __y + _hsize);
}

if(__walls & wall_left) {
	draw_line(__x - _hsize, __y - _hsize, __x - _hsize, __y + _hsize);
}

if(__walls & wall_right) {
	draw_line(__x + _hsize, __y - _hsize, __x + _hsize, __y + _hsize);
}