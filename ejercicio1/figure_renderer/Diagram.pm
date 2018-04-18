#!/usr/bin/perl

package Diagram;
use Point;

@EXPORT = qw(new, getPoint, setPoint, draw, validate);

sub new 
{
   my ($class, $newPoint) = @_;
   my $self = bless {};
   setPoint($self, $newPoint);
   return $self;
}

sub getPoint {
   my ($self) = @_;
   return $self->{Point};
}

sub setPoint {
   my ($self, $newPoint) = @_;
   $self->{Point} = $newPoint;
}

sub draw {}

sub validate{}
