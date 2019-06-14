
module rounded_cube(a,b) {
    minkowski() {
        cube([a-b*2,a-b*2,a-b*2]);
        #translate([b,b,b]) sphere(d=b*2);
    }
}

module rounded_cube_test() {
    $fn=50;
    a=10;
    b=2;
    rounded_cube(a,b);
    %cube([a,a,a]);
}

rounded_cube_test();