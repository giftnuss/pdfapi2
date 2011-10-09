use Test::More tests => 16;

use warnings;
use strict;

use PDF::API2::Lite;

my $pdf = PDF::API2::Lite->new();

isa_ok($pdf,'PDF::API2::Lite');

# check return values for methods without arguments
isa_ok($pdf->page,'PDF::API2::Lite');

# check return value for method requireing aruments
isa_ok($pdf->mediabox(100,100),'PDF::API2::Lite');

# testing serializing (stringify)
# this destroys something so further tests needs a refresh 
# this method also contains some code which is never executed?
my $str = $pdf->saveas('-');
my  @lines = split/\x0a/ , $str;

is($lines[0],"%PDF-1.4","PDF default version is 1.4 for PDF::API2::Lite");
is($lines[-1],"%%EOF","correct ending eof sequence");

# test core font exists
$pdf = PDF::API2::Lite->new();

my $font;
$font = $pdf->corefont('Times-Roman');
isa_ok($font,'PDF::API2::Resource::Font::CoreFont');
$font = $pdf->corefont('Times-Bold');
isa_ok($font,'PDF::API2::Resource::Font::CoreFont');
$font = $pdf->corefont('Helvetica');
isa_ok($font,'PDF::API2::Resource::Font::CoreFont');
$font = $pdf->corefont('ZapfDingbats');
isa_ok($font,'PDF::API2::Resource::Font::CoreFont');

$pdf = PDF::API2::Lite->new();
# RT #58386
my $egstate = $pdf->create_egs();
is(ref($egstate), 'PDF::API2::Resource::ExtGState',
   q{create_egs returns an extended graphics state object instead of dying});

# test methods delegated to PDF::API2 object
my $lite = PDF::API2::Lite->new;
$lite->page;
$pdf = PDF::API2->new;
$pdf->page;
foreach my $row (
#	[image_gif => '1x1.gif'],
	[image_jpeg => '1x1.jpg'],
	[image_png => '1x1.png'],
	[image_tiff => '1x1.tif']) {
    my $method = $row->[0];
    my $file = "t/resources/$row->[1]";
    ok(-r $file,"test image $file exists");
    my $liteimage = $lite->$method($file);
    my $pdfimage = $pdf->$method($file);

    # the objects are not easy comparable so I consider this enough
    is_deeply([keys %$liteimage],[keys %$pdfimage],
	    "method $method");
}

# Random tests
$pdf = PDF::API2::Lite->new;
$font = $pdf->corefont('Helvetica');
$pdf->page->print($font,10,100,100,90,0,'This');
$pdf->page->print($font,20,100,100,180,1,'is');
$pdf->page->print($font,30,100,100,270,2,'a test.');

#print $pdf->saveas('-');


use Data::Dumper;

