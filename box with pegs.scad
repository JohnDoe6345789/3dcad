outer_size = 200;
wall_thickness = 10;

// User sets exactly one of these:
peg_diameter = 10;     // set to 0 if you want to define padding instead
peg_padding = 3;      // set to 0 if you want to define diameter instead

// Compute missing value:
peg_diameter_final = (peg_diameter > 0) ? peg_diameter : (wall_thickness - 2 * peg_padding);
peg_padding_final = (peg_padding > 0) ? peg_padding : (wall_thickness - peg_diameter) / 2;

peg_height = 10;
peg_offset = 20;

module box_with_peg_holes() {
    difference() {
        cube(outer_size, center=true);
        cube(outer_size - 2*wall_thickness, center=true);

        for (x_sign = [-1, 1])
            for (y_sign = [-1, 1]) {
                translate([
                    x_sign*(outer_size/2 - peg_offset),
                    y_sign*(outer_size/2 - peg_offset),
                    outer_size/2 - wall_thickness
                ])
                cylinder(h=peg_height, d=peg_diameter_final, center=false);

                translate([
                    x_sign*(outer_size/2 - peg_offset),
                    y_sign*(outer_size/2 - peg_offset),
                    -outer_size/2
                ])
                cylinder(h=peg_height, d=peg_diameter_final, center=false);
            }
    }
}

module peg() {
    cylinder(h=peg_height, d=peg_diameter_final, center=false);
}

box_with_peg_holes();

// Print pegs separately (4 copies):
// translate([-20, 0, 0]) peg();
// translate([0, 0, 0]) peg();
// translate([20, 0, 0]) peg();
// translate([40, 0, 0]) peg();

