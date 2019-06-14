$fn=50;
H1=2;
H2=5;
BALL=3;
INCH=25.4;
THREAD=3.1;           // #6-32

HEAD_DIAM=7;
HEAD_HEIGHT=3;
module step4() {
    minkowski() {
        sphere(d=BALL);
        hull() {
            cylinder(h=H2,d=INCH/2);
            translate([0,0,H1/2]) cube([30,INCH/4,H1],center=true);
        }
    }
}

module step3() {
    hull() {
        cylinder(h=H2,d=INCH/2);
        translate([0,0,H1/2]) cube([30,INCH/4,H1],center=true);
    }
}

module step2() {
    cylinder(h=H2,d=INCH/2);
    translate([0,0,H1/2]) cube([30,INCH/4,H1],center=true);
}

module step1() {
    cylinder(h=H2,d=INCH/2);
}

module final() {
    difference() {
        minkowski() {
            sphere(d=BALL);
            hull() {
                cylinder(h=H2,d=INCH/2);
                translate([0,0,H1/2]) cube([30,INCH/4,H1],center=true);
            }
        }
        translate([0,0,-BALL/2]) {
            #cylinder(h=H2+BALL,d=THREAD);
            #cylinder(h=HEAD_HEIGHT,d=HEAD_DIAM);
        }
    }
}


translate([0, 0,0]) step1();
translate([0,20,0]) step2();
translate([0,40,0]) step3();
translate([0,60,0]) step4();
translate([0,80,0]) final();