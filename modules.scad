//  include <..\SCAD_modules\modules.scad>
include <gears-master\gears.scad>
	echo( " --------------------------------------------- " );
	
	echo( "INCLUDE MODULES SCAD LIB **** ") ;
	
	echo( " --------------------------------------------- " );
	////
	
module pieSlice(radius, angle, thickness){
	
	rotate_extrude(angle=angle) square([radius,thickness]);
	}
module ringSlice(radius, angle, width,  thickness){
	
	difference() {
	union() {
		rotate_extrude(angle=angle) square([radius,thickness]);
	}  union() {
		translate( [ 0 , 0 , -.5] )  cylinder( r = (radius - width), h = thickness +1 );
		}}
	}
module floor (  z = 0 , D = 350  ) {
	translate( [ 0 , 0 , -D/2 +  z ] )  cube( [ D , D , D ] , center=true );
	}
module Dshaft( Radius, H, CutRatio = .8 ) {
	difference(){
	union(){
		cylinder( r = Radius, h = H  );
	}union(){
		translate( [2*Radius * CutRatio, 0 , 0 ] )  box( 2* Radius , 2*Radius , H+1  );
		} }
	}
module servo_sg90(){
	w = 13;
	l = 23;
	d = 23;
	lip_width = 5;
	top = 6.5;
	stem_h = 4.5 ;
	
	neck_offset = 5.7;
	neck_rad = 5.7;
	neck_h = 4.8;
	plate_thick = 2.25;
	hole_offset = 2.5;
	hole_rad = 1.19;
	difference(){
	union(){
		box(l,w,d);
		translate([l/2- neck_offset , 0,d])cylinder(r=neck_rad , h = neck_h );
		
		
		translate([ l/2 - neck_offset ,0, d+neck_h])cylinder(r=stem_rad,h= stem_h);
		translate([ l/2 - neck_offset ,0, 0])cylinder(r= hole_rad ,h=d*1.5);
		translate( [ 0, 0, d-top ] ) box( l + 2 * lip_width , w, plate_thick );
		translate( [ 0 , 0 , 10 ] )
		{
		translate([l/2+hole_offset,0,0])cylinder(r=hole_rad , h=d);
		translate([-l/2-hole_offset ,0,0])cylinder(r= hole_rad ,h=d );
		}
		
		translate( [ l/2, 0, 0 ] ) box( l , w , 11 );
		}
	union(){
		}
		}
	}
stem_rad = 1.9;
module servo_3114(){
	w = 12;
	l = 22.5;
	d = 16.6;
	lip_width = 5;
	top = 6.5;
	stem_h = 4.5 ;
	neck_offset = 5.7;
	neck_rad = 5.7;
	neck_h = 4.8;
	plate_thick = 2.25;
	hole_offset = 2.5;
	hole_rad = .7;
	difference(){
	union(){
		box(l,w,d);
		translate([l/2- neck_offset , 0,d])cylinder(r=neck_rad , h = neck_h );
		
		
		#translate([ l/2 - neck_offset ,0,d+neck_h])cylinder(r=stem_rad,h= stem_h);
		#translate( [ 0, 0, d-top ] ) box( l + 2 * lip_width , w, plate_thick );
		translate([l/2+hole_offset,0,0])cylinder(r=hole_rad , h=d*1.5 );
		translate([-l/2-hole_offset ,0,0])cylinder(r= hole_rad ,h=d*1.5);
		}
	union(){
		}
		}
	}
module servo_mount(){
	difference(){
	union(){
		translate([ 9.25,2,0])box(45,18,9);
		}
	union(){
		translate([2.25,2,-11])rotate([0,0,180])servo_sg90();
		% translate([2.25,2,-11])rotate([0,0,180])servo_sg90();
		}
		}
	}
module backdrop_holder(){
	difference(){
	union(){
	box(90,20,3);
	translate([60,0,0])box(39,70,13);
	translate([-60,0,0])cylinder(r=47,h=8);
	}
	union(){
	
	translate([-60,0,0])cylinder(r=45,h=8);
	#    translate([60,0,3])box(33,72,14);
	}
	}
	}
module servo_hornhole(){
	
	#translate([0,0,-5])cylinder(r=1.2, h = 25);
	translate([0,0,1.1])cylinder(r1=4.2/2, r2=4.8/2, h = 5);
	}
function mod( fx,fm) = ( fx - fm*round( fx/fm- .5)  ) ;

module rounded_square(d,r) {
	minkowski() {
	
		translate([r,r]) square([d[0]-2*r, d[1]-2*r]);
		circle(r);
		}
	}
module rounded_box(d,r) {
	translate( [ -d[0]/2 , -d[1]/2 , 0 ] )
	linear_extrude(height = d[2] )
	minkowski() {
	
		translate([r,r]) square([d[0]-2*r, d[1]-2*r]);
		circle(r);
		}
	}
module blkfly_bracket(){
	difference(){
	union(){
		translate([0,0,0])box(40,40,5);
		translate([0,0,0])box(40,20,98);
		}
	
		translate([0,0,80])box(29.5,30,51);
		// translate([-40,0,0])cylinder(r=30/2,h=19,center=false);
		}
	}
module washer(){
	difference(){
	
		cylinder(r=13, h=3.5);
	
		cylinder(r=2.5,h=7);
		}
	}
module ruler(x,y,z,r){ translate([x,y,z])rotate([0,0,r]){
	for(i=[0:9]){
		%box(9.9,10,10,i*10+5);
		}
	
	}}
module box(w,l,h) {
	echo( " --------------------------BOX------------------- " );
	translate([-w/2,-l/2,0])cube([w,l,h]);
	}
module ring( inner_rad, wall_thick, high ){
	difference(){
	
		cylinder(r=inner_rad+wall_thick, h=high);
	
		translate([0,0,-.1])cylinder(r=inner_rad, h=high+.2);
		}
	}
module wedge(T,L,h ) {
	A =  -atan(L/h);
	translate( [ -T/2 , 0 , 0 ] )
	difference(){
	
		//translate([-w/2,-l/2,0])
		cube([T,L,h]);
	
		rotate([A,0,0])translate([-1.0,-L])cube([T+2,L,2*5*h]);
		}
	}
module cone(R1,R2,H,T){
	difference(){
	
		cylinder( r1=R1, r2=R2, h=H,center=false);
	
		translate( [ 0 , 0 , -.1 ] )
		cylinder( r1=R1-T, r2=R2-T,h=H+1,center=false);
		}
	}
//  Export  Date: 11:48:08 PM - 14:Apr:2021...

