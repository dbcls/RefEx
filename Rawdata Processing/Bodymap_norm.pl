#!/usr/bin/perl
# script to normalize

if(@ARGV == 0) {
	print STDERR "usage: $0 count_file.gz\n";
	exit 1;
}

my $cntf = shift(@ARGV);
my $tissues = '40';
my %counts;
my $totalv = '1000000';
open(FILE, "zcat $cntf |") or die "$cntf: $!\n";
while(<FILE>) {
	chomp;
	next if(/^ID/);
	my(@cnts) = split(/\t/);
	foreach my $i (1..$tissues) {
		$counts{$i} += $cnts[$i];
	}
}
close FILE;

foreach my $i (1..$tissues) {
	print STDERR "$i\t$counts{$i}\n";
}

open(FILE, "zcat $cntf |") or die "cntf: $!\n";
while(<FILE>) {
	chomp;
	if(/^ID/) { 
		print "$_\n";
		next;
	}
	my(@cnts) = split(/\t/);
	print "$cnts[0]";
	foreach my $i (1..$tissues) {
		if($counts{$i} == 0) {
			print "\t0";
		} else {
			#my $expv = $cnts[$i] * $totalv / $counts{$i};
			my $expv = int(($cnts[$i] * $totalv / $counts{$i} + .05)*10)  / 10;
			print "\t$expv";
		}
	}
	print "\n";
}
close FILE;
