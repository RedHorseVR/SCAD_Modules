//  include <..\SCAD_modules\modules.scad>//FILE: ..\SCAD_modules\modules.scad.vfc
include <gears-master\gears.scad>//FILE: ..\SCAD_modules\modules.scad.vfc
	echo( " --------------------------------------------- " );
	//x = mod( 10, 6 );
	echo( "INCLUDE MODULES SCAD LIB **** ") ;//echo( " x = ", x );
	
	echo( " --------------------------------------------- " );
	//////////////////////////////////////////////////////////////
	
module pieSlice(radius, angle, thickness){// ////
	// // a:angle, r:radius, h:height //
	rotate_extrude(angle=angle) square([radius,thickness]);// ////
	}//// //////
module ringSlice(radius, angle, width,  thickness){ 
	// // a:angle, r:radius, h:height //
	difference() {
	union() {
		rotate_extrude(angle=angle) square([radius,thickness]);// ////
	}  union() {
		translate( [ 0 , 0 , -.5] )  cylinder( r = (radius - width), h = thickness +1 );
		}}
	}//// //////
module floor (  z = 0 , D = 350  ) {
	translate( [ 0 , 0 , -D/2 +  z ] )  cube( [ D , D , D ] , center=true );//floor
	}
module Dshaft( Radius, H, CutRatio = .8 ) {
	difference(){
	union(){
		cylinder( r = Radius, h = H  );
	}union(){// } # union(){
		translate( [2*Radius * CutRatio, 0 , 0 ] )  box( 2* Radius , 2*Radius , H+1  );
		} }
	}
module servo_mini(){//// //////
	w = 9;// ////
	l = 17;// ////
	d = 16;// ////
	lip_width = 5;// ////
	top = 6.5;// ////
	stem_h = 4.5 ;
	//stem_rad = 2;
	neck_offset = 5.7;
	neck_rad = 6;
	neck_h = 4.8;
	plate_thick = 2.25;// ////
	hole_offset = 2.5/2;// ////
	hole_rad = 1.19;// ////
	translate( [ -3 , 0, 0 ] )
	difference(){//// //////
	union(){ 
		translate( [ 0 , 0 ,0 ] )  box(l,w,d); 
		translate( [ 0 , 0 , 0 ] )  box(l,w-2, d +3); 
		translate([l/2- neck_offset , 0,d-2])cylinder(r=neck_rad , h = neck_h );// neck
		translate([ -l/2 + neck_rad + 1 ,0,d])box( 2*neck_rad, 6 , 3  ); 
		 
		translate([ l/2 - neck_offset ,0, d+neck_h-2])cylinder(r=stem_rad,h= stem_h);// stem
		translate([ l/2 - neck_offset ,0, 0])cylinder(r= hole_rad ,h=d*1.5);//stem hole
		translate( [ 0, 0, d-top ] ) box( l + 2 * lip_width , w, plate_thick );// PLATE
		translate( [ 0 , 0 , 10 ] )
		{
		translate([l/2+hole_offset,0,0])cylinder(r=hole_rad , h=d);// hole
		translate([-l/2-hole_offset ,0,0])cylinder(r= hole_rad ,h=d );// hole
		}
		
		translate( [ l/2-5, 0, -2 ] ) box( l + 9 , w-1 , 10 );// servo connector wire opening
		} 
	union(){//// //////
		}// ////
		}//// //////
	}//// //////
module servo_sg90(){//// //////
	w = 13;// ////
	l = 23;// ////
	d = 23;// ////
	lip_width = 5;// ////
	top = 6.5;// ////
	stem_h = 4.5 ;
	//stem_rad = 2;
	neck_offset = 5.7;
	neck_rad = 6;
	neck_h = 4.8;
	plate_thick = 2.25;// ////
	hole_offset = 2.5;// ////
	hole_rad = 1.19;// ////
	difference(){//// //////
	union(){ 
		box(l,w,d); 
		translate([l/2- neck_offset , 0,d])cylinder(r=neck_rad , h = neck_h );// neck
		translate([ -l/2 + neck_rad + 1 ,0,d])box( 2*neck_rad, 6 , 3  ); 
		 
		translate([ l/2 - neck_offset ,0, d+neck_h])cylinder(r=stem_rad,h= stem_h);// stem
		translate([ l/2 - neck_offset ,0, 0])cylinder(r= hole_rad ,h=d*1.5);//stem hole
		translate( [ 0, 0, d-top ] ) box( l + 2 * lip_width , w, plate_thick );// PLATE
		translate( [ 0 , 0 , 10 ] )
		{
		translate([l/2+hole_offset,0,0])cylinder(r=hole_rad , h=d);// hole
		translate([-l/2-hole_offset ,0,0])cylinder(r= hole_rad ,h=d );// hole
		}
		
		translate( [ l/2, 0, 0 ] ) box( l , w , 11 );// servo connector wire opening
		} 
	union(){//// //////
		}// ////
		}//// //////
	}//// //////
stem_rad = 1.9;
module servo_3114(){//// //////
	w = 12;// ////
	l = 22.5;// ////
	d = 16.6;// ////
	lip_width = 5;// ////
	top = 6.5;// ////
	stem_h = 4.5 ;
	neck_offset = 5.7;
	neck_rad = 5.7;
	neck_h = 4.8;
	plate_thick = 2.25;// ////
	hole_offset = 2.5;// ////
	hole_rad = .7;// ////
	difference(){//// //////
	union(){ 
		box(l,w,d); 
		translate([l/2- neck_offset , 0,d])cylinder(r=neck_rad , h = neck_h );// neck
		//translate([l/2-10,0,d])box(l,10.5,7);
		 
		#translate([ l/2 - neck_offset ,0,d+neck_h])cylinder(r=stem_rad,h= stem_h);// stem
		#translate( [ 0, 0, d-top ] ) box( l + 2 * lip_width , w, plate_thick );// PLATE
		translate([l/2+hole_offset,0,0])cylinder(r=hole_rad , h=d*1.5 );// hole
		translate([-l/2-hole_offset ,0,0])cylinder(r= hole_rad ,h=d*1.5);// hole
		} 
	union(){//// //////
		}// ////
		}//// //////
	}//// //////
module servo_mount(){//// //////
	difference(){//// //////
	union(){//// //////
		translate([ 9.25,2,0])box(45,18,9);// ////
		}// ////
	union(){//// //////
		translate([2.25,2,-11])rotate([0,0,180])servo_sg90();// ////
		% translate([2.25,2,-11])rotate([0,0,180])servo_sg90();// ////
		}// ////
		}//// //////
	}//// //////
module backdrop_holder(){//// //////
	difference(){// ////
	union(){// ////
	box(90,20,3);// ////
	translate([60,0,0])box(39,70,13);// ////
	translate([-60,0,0])cylinder(r=47,h=8);// ////
	}// ////
	union(){// ////
	// //floor //
	translate([-60,0,0])cylinder(r=45,h=8);// ////
	#    translate([60,0,3])box(33,72,14);// ////
	}// ////
	}// ////
	}//// //////
module servo_hornhole(){//// //////
	// //translate([0,0,4.5])cylinder(r=6.3/2, h =14); //
	#translate([0,0,-5])cylinder(r=1.2, h = 25);// ////
	translate([0,0,1.1])cylinder(r1=4.2/2, r2=4.8/2, h = 5);// ////
	}//// //////
function mod( fx,fm) = ( fx - fm*round( fx/fm- .5)  ) ;

module rounded_square(d,r) {//// //////
	minkowski() {//// //////
	
		translate([r,r]) square([d[0]-2*r, d[1]-2*r]);// ////
		circle(r);// ////
		}//// //////
	}//// //////
module smooth_box(d, r, s= 5) {//smooth_box with consistent dimensions and alignment
	if(s == 0) {//no edge smoothing, use standard rounded_box
	
		translate( [ -d[0]/2 , -d[1]/2 , 0 ] )
		linear_extrude(height = d[2] )
		minkowski() {
		
			translate([r,r]) square([d[0]-2*r, d[1]-2*r]);// ////
			circle(r);// ////
			}
	} else {//use 3D minkowski with dimension and position compensation
		translate( [ -d[0]/2 + s , -d[1]/2 + s , s ] )//compensate for sphere offset
		minkowski() {//3D minkowski with sphere
		
			linear_extrude(height = d[2] - 2*s )//reduce height for sphere
			minkowski() {//2D minkowski for corners
			
				translate([r,r]) square([d[0]-2*r-2*s, d[1]-2*r-2*s]);// ////compensate for sphere
				circle(r);// ////
				}
			sphere(r = s);// ////sphere for edge smoothing
			}
		}
	}
module rounded_box(d,r) {//// //////
	translate( [ -d[0]/2 , -d[1]/2 , 0 ] )
	linear_extrude(height = d[2] )
	minkowski() {//// //////
	
		translate([r,r]) square([d[0]-2*r, d[1]-2*r]);// ////
		circle(r);// ////
		}//// //////
	}//// //////
module blkfly_bracket(){//// //////
	difference(){//// //////
	union(){//// //////
		translate([0,0,0])box(40,40,5);// ////
		translate([0,0,0])box(40,20,98);// ////
		}// //union(){ //
	
		translate([0,0,80])box(29.5,30,51);// ////
		// translate([-40,0,0])cylinder(r=30/2,h=19,center=false);// ////
		}////// ////////
	}//// //////
module washer( r_out = 13 , r_in =2.5 , h = 3.5  ){//// //////
	difference(){//// //////
	
		cylinder( r=r_out , h=h ); 
	
		cylinder(r=r_in, h=2*h, center = true);// ////
		}//// //////
	}//// //////
module ruler(x,y,z,r){ translate([x,y,z])rotate([0,0,r]){//// //////
	for(i=[0:9]){//// //////
		%box(9.9,10,10,i*10+5);// ////
		}//// //////
	
	}}////// ////////
module box(w,l,h, center = true ) {//// //////
	echo( " > BOX------------------- " );
	if( center  )
	{
		translate([-w/2, -l/2, 0])   cube([w,l,h], center = false); 
	} else {
		cube([w,l,h] );// ////
		}
	}//// //////
module ring( inner_rad, wall_thick, high ){//// //////
	difference(){//// //////
	
		cylinder(r=inner_rad+wall_thick, h=high);// ////
	
		translate([0,0,-.1])cylinder(r=inner_rad, h=high+.2);// ////
		}//// //////
	}//// //////
module wedge(T,L,h ) { 
	A =  -atan(L/h);// ////
	translate( [ -T/2 , 0 , 0 ] )
	difference(){//// //////
	
		//translate([-w/2,-l/2,0])// ////
		cube([T,L,h]);// ////
	//#
		rotate([A,0,0])translate([-1.0,-L])cube([T+2,L,2*5*h]);// ////
		}//// //////
	}////// ////////
module pyramid(w, l, h) {//// //////
	translate( [ w/2, -l/2 , h ] )  rotate( [ 0 , 180 , 0 ] )   {
	mw = w/2;// ////
	ml = l/2;// ////
	polyhedron(points = [// ////
	[0,  0,  0],// ////
	[w,  0,  0],// ////
	[0,  l,  0],// ////
	[w,  l,  0],// ////
	[mw, ml, h]// ////
	], triangles = [// ////
	[4, 1, 0],// ////
	[4, 3, 1],// ////
	[4, 2, 3],// ////
	[4, 0, 2],// ////
	// //base //
	[0, 1, 2],// ////
	[2, 1, 3]// ////
	]);// ////
	}//// //////
}//// //////
module cone(R1,R2,H,T){//// //////
	difference(){//// //////
	
		cylinder( r1=R1, r2=R2, h=H,center=false);// ////
	
		translate( [ 0 , 0 , -.1 ] )
		cylinder( r1=R1-T, r2=R2-T,h=H+1,center=false);// ////
		}//// //////
	}//// //////
//  Export  Date: 01:07:55 PM - 19:Jan:2026...

