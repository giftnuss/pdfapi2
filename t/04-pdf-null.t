use Test::More tests => 8;

use warnings;
use strict;

my $class;

use PDF::API2;

BEGIN {
  $class = 'PDF::API2::Basic::PDF::Null';
  use_ok($class);
};

my $null = $class->new;
isa_ok($null,$class);

is("".$null,"".$null->copy,'copy returns the same object');
is("".$null,"".$class->new,'new returns the same object');
is("".$null,"".$class->realise,'realise returns the same object');

my $pdf = PDF::API2->new;
open my $fh, '>', \my $str;
$null->outobjdeep($fh,$pdf);

is $str,'null','outobjdeep writes "null" into stream';
 
ok(!defined($null->val),'val is undef');

ok(!$null->is_obj,'$null is not an object');
