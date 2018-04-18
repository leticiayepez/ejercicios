#!/usr/bin/perl
package Triangle;

use Point;
use Diagram;
use GD;

@ISA = qw(Diagram);
@EXPORT = qw(new, getPoint1, setPoint1, getPoint2, setPoint2, getPoint3, setPoint3, draw, validate);

use constant CANVAS_X => 100;
use constant CANVAS_Y => 100;

sub new {
   my ($class, $newPoint1, $newPoint2, $newPoint3, $newPoint4) = @_;
   my $self = bless Diagram->new($newPoint1);
   $self->setPoint1($newPoint1);
   $self->setPoint2($newPoint2);
   $self->setPoint3($newPoint3);
 
   return $self;
}

sub getPoint1 {
   my ($self) = @_;
   return $self->{Point1};
}
sub setPoint1 {
   my ($self, $newPoint1) = @_;
   $self->{Point1} = $newPoint1;
}

sub getPoint2 {
   my ($self) = @_;
   return $self->{Point2};
}
sub setPoint2 {
   my ($self, $newPoint2) = @_;
   $self->{Point2} = $newPoint2;
}

sub getPoint3 {
   my ($self) = @_;
   return $self->{Point3};
}
sub setPoint3 {
   my ($self, $newPoint3) = @_;
   $self->{Point3} = $newPoint3;
}

sub draw {
   my($self) = @_;

  my $image = new GD::Image(CANVAS_X,CANVAS_Y);
  my $white = $image->colorAllocate(200,200,200);
  my $green = $image->colorAllocate(0, 255, 0); 
  my $triangle = new GD::Polygon;
  
  $triangle->addPt($self->getPoint1->getX, $self->getPoint1->getY); 
  $triangle->addPt($self->getPoint2->getX, $self->getPoint2->getY);
  $triangle->addPt($self->getPoint3->getX, $self->getPoint3->getY);

  $image->polygon($triangle, $green);       # Draw the polygon
  $image->filledPolygon($triangle,$green);
  open my $out, '>', 'Triangle.png' or die;
  binmode $out;
  print $out $image->png( );
}


sub validate {
  my($self) = @_;
  my $distanceSide1 = int(sqrt((($self->getPoint2->getX - $self->getPoint1->getX )**2) + (($self->getPoint2->getY - $self->getPoint1->getY)**2)));
  my $distanceSide2 = int(sqrt((($self->getPoint3->getX - $self->getPoint2->getX )**2) + (($self->getPoint3->getY - $self->getPoint2->getY)**2)));
  my $distanceSide3 = int(sqrt((($self->getPoint3->getX - $self->getPoint1->getX )**2) + (($self->getPoint3->getY - $self->getPoint1->getY)**2)));
  
  return 1 if ($distanceSide1 == $distanceSide2 && $distanceSide1 == $distanceSide3 && $distanceSide1 > 0 );
  return 0;
}

