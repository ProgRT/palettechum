package getcolors;

sub getcolors {
	my @colors;
	open my $input, "< :encoding(UTF-8)", $_[0];

	while (my $line = readline $input) {
		chomp $line;
		my $red;
		my $green;
		my $blue;

		($red, $green, $blue) = split "\t", $line;

		my $color = {
			red => $red,
			green => $green,
			blue => $blue,
		};

		push @colors, $color;
	}

	close $input;
	return @colors
}
1;
