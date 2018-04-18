#!usr/bin/perl
use strict;

print "Please, enter 1 line of text:\n";
my $txt1=<STDIN>;
my @areplace;
my %ruleReplace;

print "Please, enter space separated strings to match and replace (one pair per line)\n";
print "Empty line will interrupt input and start execution \n";


while ( defined( my $line=<STDIN>) ) {
    chomp $line; 

    #print "Linea:".$line.":\n";
 
    if (length $line == 0 ){
       last;
    }

    @areplace = split / /, $line;
    
    $ruleReplace{$areplace[0]} = $areplace[1];
    #print " $areplace[0] :: $ruleReplace{$areplace[0]}";
  }
  
 my $check = join '|', keys %ruleReplace;
 $txt1 =~ s/($check)/$ruleReplace{$1}/g;
  
 print STDOUT "replace:  $txt1 \n ";

