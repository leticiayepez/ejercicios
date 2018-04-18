#!usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
no warnings 'experimental::smartmatch';

my $filename = $ARGV[0];

if (defined $filename){

    open my $handle, '<', $filename;
    chomp(my @lines = <$handle>);
    close $handle;
    my @linesNum;
    my $start;
    my $stop;
    my %graph; 
    my $result;

    for(my $cont=0; $cont < @lines; $cont++){
        if ($cont == 0){
           my @param = split(' ', $lines[$cont]);
           $start=$param[0];
           $stop=$param[1]; 
        }
        else{
           my @values = split(' ', $lines[$cont]);
           push( @{$graph{$values[0]} }, $values[1]);   
        }
    }

    $result = track($start);
    print " The minimum of steps required is: ".$result." \n";

    sub track {
      my @path=@_;

      my $last=$path[-1];
 
      my $size = 0; 
      for my $next (@{$graph{$last}}) {
          next if ($next ~~ @path);
          # next if grep {$_ eq $next } @path;
          if ($next eq $stop){
           
              if ($size == 0){
                 $size = scalar(@path);
                 return $size;
              }
              else{
                 $size = scalar(@path) if scalar(@path) < $size;
                 return $size; 
              }
              #$mariano = $size;  
        } else {
            $size = $size + track(@path,$next);
            track(@path,$next); 
        }
      }
	return $size;
    }
}
