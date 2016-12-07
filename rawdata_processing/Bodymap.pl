#!/usr/bin/perl
# join libfile and unigenefile to expression matrix (raw)
# to be normalized by following script

my($libf,$unigf) = @ARGV;
my %libof;
my %cntof;
my %unigenes;
my $tissues = '40';

if(@ARGV == 0) {
	print STDERR "usage: $0 library_file.gz unigene_file.gz\n";
	exit 1;
}

open(FILE, "zcat $libf |") or die "$libf: $!\n";
while(<FILE>) {
	chomp;
	my($lib,$lib10,$lib40) = split(/\t/);
	if($tissues eq '10') {
		$libof{$lib} = $lib10;
	} else {
		$libof{$lib} = $lib40;
	}
}
close FILE;
print "ID";
foreach my $i (1..$tissues) {
	print "\t$i";
}
print "\n";

open(FILE, "zcat $unigf |") or die "$unigf: $!\n";
while(<FILE>) {
	chomp;
	my($lib,$unigene,$cnt) = split(/\t/);
	$unigenes{$unigene} = '';
	$cntof{"$unigene$;$libof{$lib}"} += $cnt;
}
close FILE;

foreach my $unigene (sort keys %unigenes) {
        print "$unigene";
	foreach my $i (1..$tissues) {
        	my $cnt = $cntof{"$unigene$;$i"};
		$cnt = 0 unless($cnt > 0);
        	print "\t$cnt";
	}
        print "\n";
}

