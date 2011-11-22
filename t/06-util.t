
use strict;
use warnings;
use utf8;

use Test::More tests => 21;

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
      '33574646a7b83957463270833737303030303030303030303030303030303030',
      '33574646a7b8395730886462f4313030'
    ]
  );
  foreach my $td (@data) {
    Test::More::is(digest($td->[1]),pack('H*',$td->[2]),"digest $td->[0]");
    Test::More::is(digest32($td->[1]),pack('H*',$td->[2]),"digest32 $td->[0]");
    Test::More::is(digest16($td->[1]),pack('H*',$td->[3]),"digest16 $td->[0]");
  }
};

package TSpace::float;
{
  use Test::Deep;

  BEGIN {
    Test::More::use_ok('PDF::API2::Util','float','floats','floats5');
  };

  my %testdata = (
      '11111.01' => '11111',
      '1111.01' => '1111',
      '111.01' => '111.01',
      '11.01' => '11.01',
      '1' => '1',
      '0.1' => '0.1',
      '0.01' => '0.01',
      '0.001' => '0.001',
      '0.0001' => '0.0001',
      '0.00001' => '0'
  );
  foreach my $num (sort keys %testdata) {
    Test::More::is("".float(1*$num),$testdata{$num},"float $num => $testdata{$num}");
  }
  my @expect = map { 1 * $testdata{$_} } sort keys %testdata;
  Test::More::is_deeply([floats(sort keys %testdata)],\@expect,'floats function');

  $testdata{'1111.01'} = 1111.01;
  $testdata{'0.00001'} = any("0.00001","1e-05");
  $testdata{'0.000001'} = 0;
  @expect = map { $testdata{$_} } sort keys %testdata;
  cmp_deeply([floats5(sort keys %testdata)],\@expect,'floats5 function');
};

package TSpace::int;
{
  BEGIN {
    Test::More::use_ok('PDF::API2::Util','intg','intgs');
  };
}

package TSpace::minmax;
{
  BEGIN {
    Test::More::use_ok('PDF::API2::Util','mMin','mMax');
  };
}

#HSVtoRGB RGBtoHSV HSLtoRGB RGBtoHSL RGBtoLUM
#namecolor
#namecolor_cmyk namecolor_lab optInvColor defineColor
#dofilter unfilter
#nameByUni
#uniByName initNameTable defineName
#page_size
#getPaperSizes
