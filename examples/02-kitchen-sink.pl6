#!/usr/bin/env perl6

use v6;
use lib 'lib';
use Terminal::Caca;

# Initialize library
my $o = Terminal::Caca.new;

# Draw a random-positioned line using the given character
given $o {

    # Helper subroutine that returns a random number
    constant MAX = 31;
    my sub random-number { (^MAX).pick }

    # Set the window title
    .title("Perl 6 rocks");

    # Draw some randomly-colored strings
    for 0..MAX -> $i {
        # Draw randomly-colored text
        .color($o.random-color, $o.random-color);
        .text(random-number, $i, "Hello world from Perl 6!");
    }

    # Draw random line types
    .color(yellow, black);
    .line(random-number, random-number, random-number, random-number, 'L');
    .thin-line(random-number, random-number, random-number, random-number);

    # Draw random box types
    .color(light-green, black);
    .box(random-number, random-number, random-number, random-number, 'B');
    .thin-box(random-number, random-number, random-number, random-number);
    .fill-box(random-number, random-number, random-number, random-number, 'B');

    # Draw random circle types
    .color(light-red, black);
    .circle(random-number, random-number, random-number, 'C');

    # Draw random ellipse types
    .color(white, blue);
    .ellipse(random-number, random-number, random-number, random-number, 'E');
    .thin-ellipse(random-number, random-number, random-number, random-number);
    .fill-ellipse(random-number, random-number, random-number, random-number, 'E');

    # Refresh display and wait for a key press
    .refresh;
    .wait-for-keypress;
}

LEAVE {
    $o.cleanup if $o;
}
