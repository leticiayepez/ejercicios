#!/usr/bin/perl

use Diagram;
use Rectangle;
use Square;
use Triangle;
use Circle;
use Switch;
use strict;

sub DrawImage {

  #my @param = @_;
  #my $type = $param[0];
  my ($type) = @_; 
   #my @scribble = (Rectangle->new(10, 20, 5, 6), Circle->new(15, 25, 8));

   # iterate through the lists and handle shapes polymorphically
   # foreach my $each (@scribble) {
   #   $each->draw;
   #   $each->rMoveTo(100, 100);
   #   $each->draw;
   #}

   switch($type){
    case 1 {
                      print "Please enter the X position for the first coordinate point  to draw the rectangle: \n ";
		      my $coordX1 = <STDIN>;
	     	      chomp $coordX1;
                     
                      print "Please enter the Y position for the first coordinate point  to draw the rectangle: \n ";
                      my $coordY1 = <STDIN>;
                      chomp $coordY1;
 
                      my $point1 = Point->new($coordX1, $coordY1);

                      print "Please enter the X position for the second coordinate point  to draw the rectangle: \n ";
                      my $coordX2 = <STDIN>;
                      chomp $coordX2;

                      print "Please enter the Y position for the second coordinate point  to draw the rectangle: \n ";
                      my $coordY2 = <STDIN>;
                      chomp $coordY2;

                      my $point2 = Point->new($coordX2, $coordY2);
 
                      print "Please enter the X position for the third coordinate point  to draw the rectangle: \n ";
                      my $coordX3 = <STDIN>;
                      chomp $coordX3;

                      print "Please enter the Y position for the third coordinate point  to draw the rectangle: \n ";
                      my $coordY3 = <STDIN>;
                      chomp $coordY3;

                      my $point3 = Point->new($coordX3, $coordY3);
                     
                      print "Please enter the X position for the fourth coordinate point  to draw the rectangle: \n ";
                      my $coordX4 = <STDIN>;
                      chomp $coordX4;

                      print "Please enter the Y position for the foruth  coordinate point  to draw the rectangle: \n ";
                      my $coordY4 = <STDIN>;
                      chomp $coordY4;

                      my $point4 = Point->new($coordX4, $coordY4);

                   
                      my $arec = Rectangle->new($point1, $point2, $point3, $point4 );
                      
                      if ( $arec->validate == 1  ){  
                      	   $arec->draw;
                           print "The image of the rectangle was generated.";
                      }
                      else{
                          print "The points are invalid to draw the rectangle.";  
                      }
           }
   case 2 {
                      print "Please enter the X position for the first coordinate point  to draw the square: \n ";
                      my $coordX1 = <STDIN>;
                      chomp $coordX1;

                      print "Please enter the Y position for the first coordinate point  to draw the square: \n ";
                      my $coordY1 = <STDIN>;
                      chomp $coordY1;

                      my $point1 = Point->new($coordX1, $coordY1);

                      print "Please enter the X position for the second coordinate point  to draw the square: \n ";
                      my $coordX2 = <STDIN>;
                      chomp $coordX2;

                      print "Please enter the Y position for the second coordinate point  to draw the square : \n ";
                      my $coordY2 = <STDIN>;
                      chomp $coordY2;

                      my $point2 = Point->new($coordX2, $coordY2);

                      print "Please enter the X position for the third coordinate point  to draw the square: \n ";
                      my $coordX3 = <STDIN>;
                      chomp $coordX3;

                      print "Please enter the Y position for the third coordinate point  to draw the square: \n ";
                      my $coordY3 = <STDIN>;
                      chomp $coordY3;

                      my $point3 = Point->new($coordX3, $coordY3);

                      print "Please enter the X position for the fourth coordinate point  to draw the square: \n ";
                      my $coordX4 = <STDIN>;
                      chomp $coordX4;

                      print "Please enter the Y position for the fourth coordinate point  to draw the square: \n ";
                      my $coordY4 = <STDIN>;
                      chomp $coordY4;
                      
                      my $point4 = Point->new($coordX4, $coordY4);

                      my $arec = Square->new($point1, $point2, $point3, $point4 );

                      if ( $arec->validate == 1  ){
                           $arec->draw;
                           print "The image of the square was generated.";
                      }
                      else{
                          print "The points are invalid to draw the square.";
                      }
          }
   case 3 {
                      print "Please enter the X position for the first coordinate point  to draw the triangle: \n ";
                      my $coordX1 = <STDIN>;
                      chomp $coordX1;

                      print "Please enter the Y position for the first coordinate point to draw the triangle: \n ";
                      my $coordY1 = <STDIN>;
                      chomp $coordY1;

                      my $point1 = Point->new($coordX1, $coordY1);

                      print "Please enter the X position for the second coordinate point  to draw the triangle: \n ";
                      my $coordX2 = <STDIN>;
                      chomp $coordX2;

                      print "Please enter the Y position for the second coordinate point  to draw the triangle: \n ";
                      my $coordY2 = <STDIN>;
                      chomp $coordY2;

                      my $point2 = Point->new($coordX2, $coordY2);

                      print "Please enter the X position for the third coordinate point  to draw the triangle: \n ";
                      my $coordX3 = <STDIN>;
                      chomp $coordX3;

                      print "Please enter the Y position for the third coordinate point  to draw the triangle: \n ";
                      my $coordY3 = <STDIN>;
                      chomp $coordY3;

                      my $point3 = Point->new($coordX3, $coordY3);

                      my $atriangle = Triangle->new($point1,$point2,$point3);

                      if ( $atriangle->validate == 1){
                           $atriangle->draw;
                           print "The image of the triangle was generated.";
                      }
                      else{
                          print "The points are invalid to draw the triangle.";   
                      }
                         
          }
   case 4 {
                      print "Please enter the X position for the center point  to draw the circle: \n ";
                      my $coordX1 = <STDIN>;
                      chomp $coordX1;

                      print "Please enter the Y position for center point to draw the circle: \n ";
                      my $coordY1 = <STDIN>;
                      chomp $coordY1;
                 
                      my $point1 = Point->new($coordX1, $coordY1);
                        
                      print "Please enter the X position belongs to point in the perimeter of the circle: \n ";
                      my $coordX2 = <STDIN>;
                      chomp $coordX2;

                      print "Please enter the Y position belongs to point in the perimeter of the circle: \n ";
                      my $coordY2 = <STDIN>;
                      chomp $coordY2;

                      my $point2 = Point->new($coordX2, $coordY2); 

                      my $acircle = Circle->new($point1, $point2);    
                      
                      if ( $acircle->validate == 1 ){
                           $acircle->draw;
                           print "The image of the circle was generated.";
                      }
                      else{
                          print "The points are invalid to draw the circle";
                      }  
          }
   else {
           print 'Ingreso opcion incorrecta. \n';
        }
   } 
}

print "Please enter the option that you want to draw: \n";
print " Number 1 for rectangle. \n";
print " Number 2 for square. \n";
print " Number 3 for triangle. \n";
print " Number 4 for circle. \n";

my $ima = <STDIN>;
chomp $ima;

DrawImage($ima);

