package hexpath;

sub hexpath {
	my $r; # Rayon du cercle intérieur de l'hexagone
	my $d;
	if ($_[0]) { $r= $_[0]; }
	else {die "hexpath: must provide radius";}

	my $h = $r/ cos(Math::Trig::deg2rad(30)); # Hypoténuse du triangle rectangle
	my $h2 = $h / 2;

	$d .= "M$h, 0 ";
	$d .= "L$h2, $r ";
	$d .= "L-$h2, $r ";
	$d .= "L-$h, 0 ";
	$d .= "L-$h2, -$r ";
	$d .= "L$h2, -$r ";
	$d .= "C";

	return $d;
}
1;
