#!/usr/bin/perl

use strict;
use warnings;

use DateTime::Format::Mail;

my $ORIGINAL = $ARGV[0];

my $RES;

my $parser = DateTime::Format::Mail->new->loose;

#my $datetime = DateTime::Format::Mail->parse_datetime($ORIGINAL);
my $datetime = $parser->parse_datetime($ORIGINAL);

$RES = $datetime->strftime("%a %b %e %T %Y");

print $RES;
