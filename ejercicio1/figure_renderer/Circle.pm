#!/usr/bin/perl
package Circle;

use Point;
use Diagram;
use GD;

@ISA = qw(Diagram);
@EXPORT = qw(new, getPoint1, setPoint1, draw);

use constant CANVAS_X => 100;
use constant CANVAS_Y => 100;

sub new {
   my ($class, $newPoint1, $newPoint2) = @_;
   my $self = bless Diagram->new($newPoint1);
   $self->setPoint1($newPoint1);
   $self->setPoint2($newPoint2); 
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

sub draw {
   my($self) = @_;

  my $image = new GD::Image(CANVAS_X,CANVAS_Y);
  my $white = $image->colorAllocate(200,200,200);
  my $black = $image->colorAllocate(0, 0, 0);
  
  my $radio = (sqrt((($self->getPoint2->getX - $self->getPoint1->getX )**2) + (($self->getPoint2->getY - $self->getPoint1->getY)**2)));   

  $image->filledArc( $self->getPoint1->getX, $self->getPoint1->getY, $radio*2, $radio*2, 0, 360, $black);
   
  open my $out, '>', 'Circle.png' or die;
  binmode $out;
  print $out $image->png( );
}


sub validate {
  my($self) = @_;
  
  return 0 if ( $self->getPoint1->getX == $self->getPoint2->getX && $self->getPoint1->getY == $self->getPoint2->getY  && $self->getPoint1->getX <= 0);
  return 1;
}
 
