
use strict;
use warnings;

use Test::More tests => 18;

use PDF::API2;
use PDF::API2::Basic::PDF::Utils;

# defaults
my $pdf = PDF::API2->new();

is_deeply($pdf->{catalog}->{PageMode},PDFName('UseNone'),
  'default pagemode');
is_deeply($pdf->{catalog}->{PageLayout},PDFName('SinglePage'),
  'default page layout');

my $pdfstring = $pdf->stringify;
like($pdfstring ,qr| /PageMode /UseNone |);
like($pdfstring, qr| /PageLayout /SinglePage |);


my $fullscreen = PDF::API2->new(-fullscreen => 1);
is_deeply($fullscreen->{catalog}->{PageMode},PDFName('FullScreen'));
like($fullscreen->stringify,qr| /PageMode /FullScreen |);


my $thumbs = PDF::API2->new(-thumbs => 1);
is_deeply($thumbs->{catalog}->{PageMode},PDFName('UseThumbs'));
like($thumbs->stringify,qr| /PageMode /UseThumbs |);


my $outlines = PDF::API2->new(-outlines => 1);
is_deeply($outlines->{catalog}->{PageMode},PDFName('UseOutlines'));
like($outlines->stringify,qr| /PageMode /UseOutlines |);



my $singlepage1 = PDF::API2->new(-singlepage => 1);
is_deeply($singlepage1->{catalog}->{PageLayout},PDFName('SinglePage'));
like($singlepage1->stringify,qr| /PageLayout /SinglePage |);


my $onecolumn = PDF::API2->new(-onecolumn => 1);
is_deeply($onecolumn->{catalog}->{PageLayout},PDFName('OneColumn'));
like($onecolumn->stringify,qr| /PageLayout /OneColumn |);


my $twocolumnleft = PDF::API2->new(-twocolumnleft => 1);
is_deeply($twocolumnleft->{catalog}->{PageLayout},PDFName('TwoColumnLeft'));
like($twocolumnleft->stringify,qr| /PageLayout /TwoColumnLeft |);


my $twocolumnright = PDF::API2->new(-twocolumnright => 1);
is_deeply($twocolumnright->{catalog}->{PageLayout},PDFName('TwoColumnRight'));
like($twocolumnright->stringify,qr| /PageLayout /TwoColumnRight |);


my $viewerprefs = PDF::API2->new(
  -hidetoolbar => 1,
  -hidemenubar => 1,
  -hidewindowui => 1,
  -fitwindow => 1,
  -centerwindow => 1,
  -displaytitle => 1,
  -righttoleft => 1);

is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{HideToolbar}, PDFBool(1));
is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{HideMenubar}, PDFBool(1));
is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{HideWindowUI}, PDFBool(1));
is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{FitWindow}, PDFBool(1));
is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{CenterWindow}, PDFBool(1));
is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{DisplayDocTitle}, PDFBool(1));
is_deeply($viewerprefs->{catalog}->{ViewerPreferences}->{Direction}, PDFName("R2L"));

__END__



453	
0
					
	    if($opt{-afterfullscreenthumbs}) {

	        $self->{catalog}->{ViewerPreferences}->{NonFullScreenPageMode}=PDFName('UseThumbs');
454							    } elsif($opt{-afterfullscreenoutlines}) {
455	
0
					
0
	        $self->{catalog}->{ViewerPreferences}->{NonFullScreenPageMode}=PDFName('UseOutlines');
456							    } else {
457	
73
					
832
	        $self->{catalog}->{ViewerPreferences}->{NonFullScreenPageMode}=PDFName('UseNone');
458							    }
459	
460	
73
	
50
				
416
	    if($opt{-printscalingnone}) {
461	
0
					
0
	                $self->{catalog}->{ViewerPreferences}->{PrintScaling}=PDFName("None");
462							    }




# open pdf file over option new - this destroys sample?
# my $pdf2 = PDF::API2->new(-file => 't/resources/sample.pdf');

# $pdf2 = PDF::API2->new(-file => 'unknown/path/and/file.pdf');

