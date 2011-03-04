use Test::More tests => 2;

use warnings;
use strict;

use PDF::API2;

my $pdf = PDF::API2->new();
$pdf->{forcecompress} = 0;

my $tiff = $pdf->image_tiff('t/resources/1x1.tif');
isa_ok($tiff, 'PDF::API2::Resource::XObject::Image::TIFF',
       q{$pdf->image_tiff()});

my $gfx = $pdf->page->gfx();
$gfx->image($tiff, 72, 144, 216, 288);
like($pdf->stringify(), qr/q 216 0 0 288 72 144 cm \S+ Do Q/,
     q{Add TIFF to PDF});
