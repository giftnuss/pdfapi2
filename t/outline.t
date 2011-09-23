use Test::More tests => 7;

use warnings;
use strict;

use PDF::API2;

my $pdf = PDF::API2->new();
$pdf->{forcecompress} = 0;
my $page1 = $pdf->page();
my $page2 = $pdf->page();

my $outlines = $pdf->outlines();
my $outline = $outlines->outline();
$outline->title('Test Outline');
$outline->dest($page2);

like($pdf->stringify, qr{/Dest \[ 6 0 R /XYZ null null null \] /Title \(Test Outline\) /Parent 7 0 R},
     q{Basic outline test});

# outline unit tests - with prev
my $unit = PDF::API2::Outline->new($pdf,$page2,$page1);

is($unit->parent,$page2,'call get parent');
is($unit->prev,$page1,'call get prev');

# outline unit tests - without prev
$unit = PDF::API2::Outline->new($pdf,$page1);

is($unit->parent,$page1,'call get parent');
is($unit->prev,undef,'get prev returns undef');

# unit test file & url
$unit->file(__FILE__);
is($unit->{Dest},undef,'outline has no dest when file is set');

$unit->url('http://search.cpan.org');
is($unit->{Dest},undef,'outline has no dest when file is set');

