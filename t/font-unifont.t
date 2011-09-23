use Test::More tests => 3;

use utf8;

use PDF::API2;

my $pdf = PDF::API2->new;

my $unifont = $pdf->unifont();
isa_ok($unifont,'PDF::API2::Resource::UniFont');

ok($unifont->isvirtual,'this object is virtual');

is_deeply($unifont->fontlist,[],'start with empty font list');

my $font = $pdf->bdfont('t/resources/A.bdf');

# funny - register a one letter font for whole unicode
$unifont = $pdf->unifont($font);

$unifont->{encode} = 'utf-8';
$unifont->text('A',40);

my $page = $pdf->page;
my $gfx = $page->gfx;
$gfx->textlabel(100,100,$unifont,100,'A');
$gfx->save();

#$pdf->saveas('1.pdf');

