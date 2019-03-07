///@desc return -1 if out of range
///@param x
///@param y

var xx = argument0;
var yy = argument1;
var width = argument2;
var height = argument3;

if(xx > width - 1 || xx < 0 || yy > height - 1 || yy < 0) return -1;

return xx + yy * width;