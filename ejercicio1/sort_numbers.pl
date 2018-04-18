#!usr/bin/perl
use strict;
use Lingua::EN::Words2Nums;


my $filename=$ARGV[0];

if (defined $filename){

    open my $handle, '<', $filename;
    chomp(my @lines = <$handle>);
    close $handle;
    my @linesNum;

    foreach my $line (@lines){
        #print " value $line \n ";
        push @linesNum, words2nums($line);
        #print $toNum;
    }
    my @linesNumSorted = sort {$a <=> $b} @linesNum;
    print STDOUT "@linesNumSorted\n";
}

