
use strict;
use warnings;
use utf8;

use Test::More tests => 7;

package TSpace::pdfkey;
{
  BEGIN {
    Test::More::use_ok('PDF::API2::Util','pdfkey');
  };

  my $start = pdfkey();
  my @list = ($start,map { pdfkey } 1..3);
  my @expect = (my $one=$start,my $two=++$start,my $three=++$start,my $four=++$start);

  Test::More::is_deeply(\@list,\@expect,"pdfkey creates sequence");
};

package TSpace::digest;
{
  BEGIN {
    Test::More::use_ok('PDF::API2::Util','digest','digest16','digest32');
  };
  my @data = (
    ['simple string','hello pdfapi2',
      '',
      ''  
    ]
  );
  foreach my $td (@data) {
    Test::More::is(digest($td->[1]),$td->[2],"digest $td->[0]");
    Test::More::is(digest32($td->[1]),$td->[2],"digest32 $td->[0]");
    Test::More::is(digest16($td->[1]),$td->[2],"digest16 $td->[0]");
  }
};

package TSpace::float;
{
  BEGIN {
    Test::More::use_ok('PDF::API2::Util','float','floats','floats5');
  };

};

#intg intgs
#mMin mMax
#HSVtoRGB RGBtoHSV HSLtoRGB RGBtoHSL RGBtoLUM
#namecolor
#namecolor_cmyk namecolor_lab optInvColor defineColor
#dofilter unfilter
#nameByUni
#uniByName initNameTable defineName
#page_size
#getPaperSizes
