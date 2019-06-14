$fn=50;
q=30;
z=4;

difference() {
    union() {
        cube([q,q,q/z]);
        cube([q/z,q,q]);
    }
    rotate([0,45,0]) #cube([.25,20,20]);
    translate([10,10,0]) rotate([0,-45,0]) translate([0,0,-5]) #cylinder(20,d=2);
}