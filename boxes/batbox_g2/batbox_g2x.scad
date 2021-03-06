// battery holder for 50mm ammo can

$fn=50;
//ammo can inside dimensions.  long side is x axis.
can_x = 281;
can_y = 144;
can_z = 173;
can_gap = 1;    // leave this gap between the box and can walls

wall=1;         // thickness of wall being printed
floor = wall;   // thickness of floor being printed

// internal maximum box
box_max_x = can_x - 2 * can_gap;
box_max_y = can_y - 2 * can_gap;
box_max_z = can_z;

INCH=25.4;
//THREAD=1/4*INCH-.2;
THREAD=3.1;           // #6-32


module column(xoffset,ny, batx, baty, batz, cubey) {
    border=5;
    for (c=[0:ny/2-1]) {
        translate([xoffset,wall+c*baty+c,wall]) {
            cube([batx,baty,batz]);
            translate([border,border,-wall])
                cube([batx-2*border,baty-2*border,batz]);
        }
        translate([xoffset,cubey-wall-baty*(c+1)-c,wall]) {
            cube([batx,baty,batz]);
            translate([border,border,-wall])
                cube([batx-2*border,baty-2*border,batz]);
        }
    }
    if (ny%2 == 1) {
        translate([xoffset,wall+cubey/2-baty/2,wall]) {
            cube([batx,baty,batz]);
            translate([border,border,-wall])
                cube([batx-2*border,baty-2*border,batz]);
        }
    }
}

module b0(t,nx, ny, batx, baty, cubex=-1, cubey=box_max_y, cubez=30) {
    cubex = (cubex==-1) ? wall+nx*(wall+batx) : cubex;
    difference() {
        union() {
            b1(nx, ny, batx, baty, cubex, cubey, cubez);
            translate([cubex/2,cubey/2,0]) cylinder(h=cubez,d=THREAD*1.5);
        }
        translate([cubex/2,cubey/2,0])cylinder(h=cubez,d=THREAD);
    }
}

module b1(nx, ny, batx, baty, cubex=-1, cubey=box_max_y, cubez=30) {
    difference() {
        cube([cubex,cubey,cubez]);
        for (r=[0:nx-1]) {
            xoffset=wall+r*batx+r;
            column(xoffset,ny,batx, baty, cubez, cubey);
        }
    }
}

//b0("2s300",1,8,17,13.5,cubez=35);  //fatter
//b0("2s300",1,8,16.5,13.3,cubez=50);
//b0("2s300",2,9,20.5,13.5);
b0("3s500",2,6,32.5,17.5,cubez=60);
//b0("3s1300",2,4,36,29,cubez=60);
//b0("4s1000",1,4,35,30,cubez=60);
//b0("4s1300",1,4,36,32,cubez=60);
//b0("4s1800",1,4,36,34,cubez=60);
//b0("4s3000",1,4,44,35,cubez=60);
//b0("4s3000",2,3,35,44,cubez=60);
