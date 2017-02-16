while(<>) {
        chomp;
        my($tax,$gene,$pubmed) = split(/\t/);
        next unless($tax eq '9606');
        $counter{$gene}++;
}
foreach (sort keys %counter) {
        print "$_\t$counter{$_}\n";
}
