#!usr/bin/perl
use strict;

sub prime {
    my $number = shift;
    my $d = 2;
    my $sqrt = sqrt $number;
    while(1) {
        if ($number%$d == 0) {
            return 0;
        }
        if ($d < $sqrt) {
            $d++;
        } else {
            return 1;
        }
    }
}

#my $number = $ARGV[0];
print 'Please enter a number:';
my $number=<STDIN>;

my $list='';
if ( $number >= 2 && $number <= 1000000){
  foreach my $n(1..$number-1){
    if (prime($n) == 1 ){ 
      $list = $list.' '.$n;
    }   
  }
} 
print STDOUT "$list \n"; 
