#!/usr/bin/perl
package Square;

use Point;
use Diagram;
use GD;

@ISA = qw(Diagram);
@EXPORT = qw(new, getPoint1, setPoint1, getPoint2, setPoint2, getPoint3, setPoint3, getPoint4, setPoint4, draw, validate);

use constant CANVAS_X => 100;
use constant CANVAS_Y => 100;

sub new {
   my ($class, $newPoint1, $newPoint2, $newPoint3, $newPoint4) = @_;
   my $self = bless Diagram->new($newPoint1);
   $self->setPoint1($newPoint1);
   $self->setPoint2($newPoint2);
   $self->setPoint3($newPoint3);
   $self->setPoint4($newPoint4);
 
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

sub getPoint4 {
   my ($self) = @_;
   return $self->{Point4};
}
sub setPoint4 {
   my ($self, $newPoint4) = @_;
   $self->{Point4} = $newPoint4;
}

sub draw {
   my($self) = @_;

  my $image = new GD::Image(CANVAS_X,CANVAS_Y);
  my $white = $image->colorAllocate(200,200,200);
  my $red = $image->colorAllocate(255, 0, 0); 
  my $square = new GD::Polygon; 
  
  $square->addPt($self->getPoint1->getX, $self->getPoint1->getY); 
  $square->addPt($self->getPoint2->getX, $self->getPoint2->getY);
  $square->addPt($self->getPoint3->getX, $self->getPoint3->getY);
  $square->addPt($self->getPoint4->getX, $self->getPoint4->getY);
  $image->polygon($square, $red);
  $image->filledPolygon($square, $red);

  open my $out, '>', 'Square.png' or die;
  binmode $out;
  print $out $image->png( );

}

sub validate {
  my($self) = @_;
  my $distanceSideTop = (sqrt((($self->getPoint2->getX - $self->getPoint1->getX )**2) + (($self->getPoint2->getY - $self->getPoint1->getY)**2)));
  my $distanceSideBottom = (sqrt((($self->getPoint3->getX - $self->getPoint4->getX )**2) + (($self->getPoint3->getY - $self->getPoint4->getY)**2)));
  my $distanceSideLeft = (sqrt((($self->getPoint4->getX - $self->getPoint1->getX )**2) + (($self->getPoint4->getY - $self->getPoint1->getY)**2)));
  my $distanceSideRight = (sqrt((($self->getPoint3->getX - $self->getPoint2->getX )**2) + (($self->getPoint3->getY - $self->getPoint2->getY)**2)));

  if ($distanceSideTop == $distanceSideBottom && $distanceSideLeft == $distanceSideRight && $distanceSideTop == $distanceSideLeft && $distanceSideTop >= 0 && $distanceSideLeft >= 0 ){
      return 1;
  }
  else{
     return 0;
  }
}

