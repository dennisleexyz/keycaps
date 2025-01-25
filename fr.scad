include <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
include <key.scad/key.scad>
include <stem.scad>

$fa = 8;
$fs = 0.25; // .01
//$fa = 0.01;
//$fs = 0.01; // .01

// spacing between key centers (X-axis)
kx = U;
// spacing between key centers (Y-axis)
ky = U;
// keycap width (cherry: 18, choc: 17.5)
keycw = 18;
// keycap height (cherry: 18, choc: 16.5)
keych = 18;
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
flip = false;

if (flip)
    mirror([0, 0, 1])
        main();
else
    main();

module main() {
    render() difference() {
        let (
            x = kx*(size.x-1) + keycw,
            y = ky*(size.y-1) + keych,
            top_dimensions = BASE_TOP_DIMENSIONS,
            r = max(r_base-(max(
                top_dimensions.x-((floor(top_dimensions.x/kx)-1)*kx+keycw),
                top_dimensions.y-((floor(top_dimensions.y/ky)-1)*ky+keych)
            ))/2, 0)
        ) {
            translate([-x/2+r, -y/2+r, 0])
                rounded_square([x, y, h], r);
        }
        let (
            x = housing.x,
            y = housing.y,
            z = h-1.2,
            r = 0.5
        ) {
            translate([-x/2+r, -y/2+r, 0])
                rounded_square([x, y, z], r);
        }
    }
    stem(h-1.2, stem, d);
}