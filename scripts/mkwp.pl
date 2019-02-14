#!/bin/perl

use strict;
use warnings;
use feature "say";
use lib "./lib", "../lib";

use getcolors;
use hexpath;
use Math::Trig;

my $wpstring = "<!DOCTYPE html>
<meta charset='UTF-8'>

<style>

html {
  background-color: rgb(0, 64, 113);
	font-family: Sans-Serif;
}

h1 {
  text-align: center;
	padding: 0.5em;
}

div {
  border: none;
}
div#content {
  background-color: white;
	max-width: 800px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 0px 0px 30px 0px;
	padding: 10px;
}

div#content div {
  margin: 10px;
	display: inline-block;
}

svg {
	vertical-align: top;
}

table {
 margin-left: 20px;
 display: inline;
 vertical-align: top;
}
</style>

<div id='content'>
<h1>Palette de couleurs CHUM</h1>
";


foreach (getcolors::getcolors("Palettes/chum_rgb.tsv")){
	my $d = hexpath::hexpath(50);
	my $fillcolor = "rgb($_->{red}, $_->{green}, $_->{blue})";
	my $newstring = "<div>
<svg viewBox='-60 -50 120 100' width='120' height='105'>
<path d='$d' style='fill: $fillcolor'/>
</svg>

<table>
<colgroup>
<col style='width: 55px'>
<col style='width: 9em; text-align: right'>
</colgroup>
<tr>
<td>
RVB:
</td>
<td style='text-align: left'>
$_->{red} -
$_->{green} -
$_->{blue}
</td>
</tr>
</table>
</div>\n";
	$wpstring .= $newstring;
}
$wpstring .= "</div>";

open(my $output, ">", "index.html");
print $output $wpstring;
close $output;
