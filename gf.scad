include <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
include <key.scad/key.scad>
include <stem.scad>

$fa = 8;
$fs = 0.25; // .01
//$fa = 0.01;
//$fs = 0.01; // .01

// spacing between key centers (X-axis)
kx = GRID_DIMENSIONS_MM.x/2;
// spacing between key centers (Y-axis)
ky = GRID_DIMENSIONS_MM.y/2;
// keycap width (cherry: 18, choc: 17.5)
keycw = BASE_TOP_DIMENSIONS.x/2;
// keycap height (cherry: 18, choc: 16.5)
keych = BASE_TOP_DIMENSIONS.y/2;
size = [1, 1];

supported = [mx, choc_v2];
housing = [
    max([for(sw=supported)housing(sw).x]),
    max([for(sw=supported)housing(sw).y]),
];
stem = min([for(sw=supported)stem(sw)]);
// how should the top lip act
style_lip = 0; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]
// keycap Z-height
h = stem + min([for(sw=supported)height(h(sw),2,style_lip,true)-h(sw)+BASE_HEIGHT]);
    echo(h);
// stem diameter
d = 5.5;

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
            gf_bin();
        }
        let (
            base_bottom = base_bottom_dimensions(BASE_TOP_DIMENSIONS),
            x = kx*(size.x-1) + base_bottom.x,
            y = ky*(size.y-1) + base_bottom.y,
            z = stem
        ) {
            translate([-x/2, -y/2])
                cube([x, y, z]);
        }
    }
    render() difference() {
        stem(stem, stem, d);
    }
}

module gf_bin() {
    let (g = size / 2) {
        difference() {
            gridfinityInit(gx = g.x, gy = g.y, h = hf(h-BASE_HEIGHT,2,style_lip),sl=style_lip);
            rounded_square([kx*(size.x-1)+keycw,ky*(size.y-1)+keych,BASE_HEIGHT], 0, true);
        }
        gridfinityBase(grid_size = [g.x, g.y], final_cut = true);
    }
}
