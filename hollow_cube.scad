// Outer cube size
outer_size = 200;
// Wall thickness
wall_thickness = 3;

// Create outer cube
difference() {
    cube(outer_size, center=true);
    // Subtract inner cube to hollow out
    cube(outer_size - 2*wall_thickness, center=true);
}
