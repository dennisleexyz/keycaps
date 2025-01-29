include <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
include <key.scad/key.scad>
include <stem.scad>

$fa = 8;
$fs = 0.25; // .01
//$fa = 0.01;
//$fs = 0.01; // .01

scale = 0.42;

// spacing between key centers (X-axis)
kx = U;
// spacing between key centers (Y-axis)
ky = U;
// keycap width (cherry: 18, choc: 17.5)
keycw = BASE_TOP_DIMENSIONS.x*scale;
// keycap height (cherry: 18, choc: 16.5)
keych = BASE_TOP_DIMENSIONS.y*scale;
size = [1, 1];

supported = [mx, choc_v2];
housing = [
    max([for(sw=supported)housing(sw).x]),
    max([for(sw=supported)housing(sw).y]),
];
stem = min([for(sw=supported)stem(sw)]);
// keycap Z-height
h = stem + min([for(sw=supported)height(h(sw),2,1,true)-h(sw)+BASE_HEIGHT]);
// stem diameter
d = 5.5;
// how should the top lip act
style_lip = 0; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]
orientation = "up"; // [up: Up, down: Down]
stackable = false;

angle = 0; // [0:45:180]

rotate([angle, 0, 0])
    main();

module main() {
    render() difference() {
        let (
            x = kx*(size.x-1) + keycw,
            y = ky*(size.y-1) + keych,
            top_dimensions = BASE_TOP_DIMENSIONS
        ) {
            if (orientation == "down")
                translate([0, 0, h]) mirror([0, 0, 1])
                     mf_bin();
            else
                mf_bin();
        }
        let (
            x = kx*(size.x-1) + housing.x,
            y = ky*(size.y-1) + housing.y,
            z = orientation == "up" ? stem : h-1.2,
            r = 0.5
        ) {
            translate([-x/2+r, -y/2+r, 0])
                rounded_square([x, y, z], r);
        }
    }
    render() difference() {
        stem(stem, stem, d);
        if (orientation != "up" && style_lip != 2 && stackable)
            cylinder(h = STACKING_LIP_SIZE.y*scale, d = d);
    }
}

module mf_bin() {
    scale(scale) {
        gridfinityInit(gx = size.x, gy = size.y, h = hf(h/scale-BASE_HEIGHT-STACKING_LIP_SIZE.y,2,style_lip),sl=style_lip);
        gridfinityBase(grid_size = [size.x, size.y]);
    }
}
