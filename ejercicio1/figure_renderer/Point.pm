#!/usr/bin/perl

package Point;
@EXPORT = qw(new, getX, getY, setX, setY);

sub new 
{
   my ($class, $newx, $newy) = @_;
   my $self = bless {};
   setX($self, $newx);
   setY($self, $newy);
   return $self;
}

sub getX {
   my ($self) = @_;
   return $self->{x};
}

sub getY {
   my ($self) = @_;
   return $self->{y};
}

sub setX {
   my ($self, $newx) = @_;
   $self->{x} = $newx;
}

sub setY {
   my ($self, $newy) = @_;
   $self->{y} = $newy;
}

