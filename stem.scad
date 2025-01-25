use <gridfinity-rebuilt-openscad/src/helpers/generic-helpers.scad>

//---Stem param
Tol    = 0.10;

//MXWid = 4.03/2+Tol; //horizontal length
MXLen = 4.23/2+Tol; //vertical length
MXWid = MXLen; //horizontal length

//MXWidT = 1.15/2+Tol; //horizontal thickness
MXLenT = 1.25/2+Tol; //vertical thickness
MXWidT = MXLenT; //horizontal thickness

/**
 * @param oh outer height
 * @param ih inner height
 * @param d diameter
 * @param z Z-offset
 */
module stem(oh, ih, d, z=0) {
    render() translate([0, 0, z]) difference() {
        cylinder(h = oh, d = d);
        linear_extrude(ih)
            pattern_circular(n = 4)
                polygon([
                    [0, 0],
                    [0, MXLen],
                    [MXLenT, MXLen],
                    [MXLenT, MXWidT],
                    [MXWid, MXWidT],
                    [MXWid, 0]
                ]);
    }
}

module choc_stem() {
}