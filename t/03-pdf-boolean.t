use Test::More tests => 9;

use warnings;
use strict;

my $class;
BEGIN {
  $class = 'PDF::API2::Basic::PDF::Bool';
  use_ok($class);
};

my $bool = $class->new;
isa_ok($bool,$class);
isa_ok($bool,'PDF::API2::Basic::PDF::String');

ok($bool->convert('true'),"true is true"); # only true is true
ok(!$bool->convert('false'),"false is not true");
ok(!$bool->convert('TRUE'),"TRUE is not true");
ok(!$bool->convert(1),"1 is not true");

is($class->from_pdf('true')->as_pdf,'true','true is true');
is($class->from_pdf('false')->as_pdf,'false','false is false');

