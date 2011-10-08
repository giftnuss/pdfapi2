
use strict;
use warnings;

use Test::More tests => 3;
use PDF::API2;

my $runtodo = $ENV{'RUN_TODO_TESTS'};

ok(1,'to do something');

# When an image is not loaded succesfully the exception
# is currently not helpful.
my $pdf = PDF::API2->new();
eval {
     my $jpg = $pdf->image_jpeg('not-found.jpg');
};
ok($@,'throw excepion when image file is not readable');
TODO: {
    todo_skip "todo better missing file exception" if !$runtodo;
    unlike("$@",qr/Can't call method "val" on an undefined value/);
};


