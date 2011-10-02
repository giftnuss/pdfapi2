
use Test::More tests => 2;
# Abstract:  test with sample pdfs borrowed from the PDF spec document

use strict;
use warnings;

use Data::Dumper;

use PDF::API2;

# this is the result of print PDF::API2->new->stringify
# with small modifications
my $simple = <<'__PDF__';
%PDF-1.4
1 0 obj << /Type /Catalog /ViewerPreferences << /NonFullScreenPageMode /UseNone >> /PageLayout /SinglePage /Pages 2 0 R /PageMode /UseNone >> endobj
2 0 obj << /Type /Pages /Kids [ ] /Resources 3 0 R /Count 0 >> endobj
3 0 obj << /ProcSet [ /PDF /Text /ImageB /ImageC /ImageI ] >> endobj
4 0 obj << /Producer (PDF::API2  [linux]) >> endobj
xref
0 5
0000000000 65535 f 
0000000009 00000 n 
0000000158 00000 n 
0000000228 00000 n 
0000000297 00000 n 
trailer
<< /Root 1 0 R /Size 5 /Info 4 0 R >>
startxref
349
%%EOF
__PDF__

my $pdf = PDF::API2->openScalar($simple);
isa_ok($pdf,'PDF::API2');

my $minimal = <<'__PDF__';
%PDF-1.4
1 0 obj
  << /Type /Catalog
     /Outlines 2 0 R
     /Pages 3 0 R
  >>
endobj
2 0 obj
  << /Type Outlines
     /Count 0
  >>
endobj
3 0 obj
  << /Type /Pages
     /Kids [ 4 0 R ]
     /Count 1
  >>
endobj
4 0 obj
<< /Type /Page
/Parent 3 0 R
/MediaBox [ 0 0 612 792 ]
/Contents 5 0 R
/Resources << /ProcSet 6 0 R >>
>>
endobj
5 0 obj
<< /Length 00 >>
stream
endstream
endobj
6 0 obj
<< [ /PDF ] >>
endobj
xref
0 7
0000000000 65535 f
0000000009 00000 n
0000000090 00000 n
0000000135 00000 n
0000000200 00000 n
0000000295 00000 n
0000000379 00000 n
trailer
    << /Size 7
       /Root 1 0 R
     >>
startxref
414
%%EOF
__PDF__

$pdf = PDF::API2->openScalar($minimal);

isa_ok($pdf,'PDF::API2');
