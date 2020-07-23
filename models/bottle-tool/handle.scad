
module t1() {
    cylinder(d=38,h=14);
}
module t2() {
    cylinder(d=38,h=14);
    translate([-20,0,0]) cylinder(d=22,6);
    translate([20,0,0]) cylinder(d=22,6);
}
module t3() {
    hull() {
        cylinder(d=38,h=14);
        translate([-20,0,0]) cylinder(d=22,6);
        translate([20,0,0]) cylinder(d=22,6);
    }
}

module t4() {
    minkowski() {
        sphere(2);
        hull() {
            cylinder(d=38,h=14);
            translate([-20,0,0]) cylinder(d=22,6);
            translate([20,0,0]) cylinder(d=22,6);
        }
    }
}

module t5() {
    round=2;
    minkowski() {
        sphere(round);
        hull() {
            cylinder(d=38-round,h=14-round);
            translate([-20,0,0]) cylinder(d=22-round,6-round);
            translate([20,0,0]) cylinder(d=22-round,6-round);
        }
    }
}


// t1();
translate([0,-50,0]) t2();
translate([0,-100,0]) t3();
translate([0,-150,0]) t4();
translate([0,-200,0]) t5();

difference() { t5(); t3(); }
