#!/usr/bin/perl
use strict;
use warnings;

my ($paramA, $paramB, $paramC) = @ARGV;
my ($resultP, $resultN);

if ((not defined $paramA) || (not defined $paramB) || (not defined $paramC)) {
  print STDERR "Incorrectos parametros.\n";
  exit; 
}

##$resultP=(-$paramB + sqrt(($paramB**2)-4*$paramA*$paramC))/(2*$paramA);
##$resultN=(-$paramB - sqrt(($paramB**2)-4*$paramA*$paramC))/(2*$paramA);

eval {
 $resultP=(-$paramB + sqrt(($paramB**2)-4*$paramA*$paramC))/(2*$paramA);
 $resultN=(-$paramB - sqrt(($paramB**2)-4*$paramA*$paramC))/(2*$paramA);
 print STDOUT "$resultP y $resultN son los resultados.\n"; 
 1 
}
or do{
  print STDERR "ERROR en el calculo.\n"
}
;


