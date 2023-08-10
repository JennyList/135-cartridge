/*
A re-usable 135 film cartridge
Jenny List 2023
CC-BY-SA 4.0

*/
module Reel35(){
    difference(){
        union(){
            cylinder(46,5.5,5.5,$fn=90,true); //shaft
            translate([0,0,16.75]) cylinder(1.5,7,7,$fn=120,true); //spacer
            translate([0,0,-21.25]) cylinder(1,10.25,10.25,$fn=90,true); //bottom flange
            translate([0,0,15.5]) cylinder(1,10.25,10.25,$fn=90,true);//top flange
        } 
        translate([0,0,-15.5])cylinder(15,4.5,4.5,$fn=90,true); //cut out bottom 
        translate([0,0,15.5])cylinder(15,4.5,4.5,$fn=90,true); //cut out top
    }
    difference(){ //tabs for film winder to engage
        cube([1,10,40],true); 
        cylinder(40,2.25,2.25,$fn=90,true);
    }
}

module Lid35(){
    difference(){
        union(){
            cylinder(1,12.25,12.25,$fn=120,true); //flat lid
            translate([11.75,5.75,0])cube([1,13,1],true); //tangent
            translate([6,11.75,0])cube([12,1,1],true); //tangent.
            translate([5.5,5,0]) cube([13,13,1],true); //Cube to fill in the hole
            translate([0,0,1.5]) cylinder(2,11.25,11.25,$fn=120,true);// protrusion
           
        }
        translate([0,0,1.5]) cylinder(2,10.25,10.75,$fn=120,true); //carve out the middle.
        translate([7,10.25,1.5])cube([13,3,2],true); //tangent .
        cylinder(5,5.75,5.75,$fn=120,true); //hole
    }
    translate([0,10.75,0.5]) cube([12.25,0.5,2]);//straight bit of light seal on output
}

module Cartridge35(){
    difference(){
        union(){
            difference(){
                union(){
                    cylinder(40,12.25,12.25,$fn=120,true); //main cylinder
                    translate([11.75,5.75,0])cube([1,13,40],true); //tangent side
                    translate([6,11.75,0])cube([12,1,40],true); //tangent top
                    translate([5.5,5,0]) cube([13,13,40],true); //Cube to fill in the hole
                }
                cylinder(40,11.25,11.25,$fn=120,true);  //Carve out space for film
            }
        }
        translate([8,10.5,0])cube([16,1.5,40],true); //film guide

    }
}

translate([0,0,20]) Cartridge35();
translate([28,0,0.5]) Lid35();
mirror ([0,1,0]) translate([0,28,0.5]) Lid35();
translate([30,-30,23]) Reel35();


