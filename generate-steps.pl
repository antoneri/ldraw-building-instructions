#!/usr/bin/env perl

use strict;
use warnings;
use 5.14.0;

our $Y = 3;
our $RAISE = -100; # Ldraw uses negative Y for up

exit main();

sub main {
  my $fmt = "step%04d.ldr";
  my @file_lines;
  my $step = 0;

  while (<>) {
    next if (/^0/gms);
    my @line = split(' ');

    $line[$Y] += $RAISE;

    open(my $fh, '>', sprintf $fmt, $step) or die('Could not open file!');

    for my $i (0..$#file_lines) {
      print $fh $file_lines[$i];
    }

    say $fh join(' ', @line);

    close $fh;

    push @file_lines, $_;

    $step++;
  }

  open(my $fh, '>', sprintf $fmt, $step) or die('Could not open file!');

  for my $i (0..$#file_lines) {
    print $fh $file_lines[$i];
  }

  close $fh;

  return 0;
}

