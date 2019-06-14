$fn=50;
q=30;
z=4;

module old() {
    difference() {
        union() {
            cube([q,q,q/z]);
            cube([q/z,q,q]);
        }
        translate([0,0,4.6]) rotate([0,68,0]) #cube([.5,20,20]);
        translate([10,10,0]) rotate([0,-45,0]) translate([0,0,-5]) #cylinder(20,d=2);
    }
}

a=45;
//a=68;
ww=20;
hh1=60;
hh2=40;
zz=50;
slit=.2;
module new() {
    difference() {
        union() {
            translate([-ww,-ww,0]) cube([ww,hh1,zz]);
            translate([-ww,-ww,0]) cube([hh2,ww,zz]);
        }
    #mirror([90,90,0]) translate([0,0,10]) rotate([0,0,a-90]) cube([slit,hh1,hh1]);
    }
}

//old();
new();