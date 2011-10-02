
use strict;
use warnings;
use utf8;

use Test::More tests => 8;

my $class;
BEGIN {
  $class = 'PDF::API2::Basic::PDF::String'; 
  use_ok($class);
};

my @simple = (
  'This is a string.',
  '7.895e-8',
  '',
  '% string not comment'
);

foreach my $txt (@simple) {
   my $str = $class->new($txt);
   is($str->as_pdf,"($txt)");
}

my %escapes = (

  '()' => '\\(\\)', # balanced paranthesis could be used unescaped
  '\\' => '\\\\'
);

foreach my $txt (keys %escapes) {
   my $str = $class->new($txt);
   is($str->as_pdf,"($escapes{$txt})");
}

my %binary = (
  '2,66 € / 100 g' => '<322C36362020AC202F203130302067>'
);

foreach my $txt (keys %binary) {
   my $str = $class->new($txt);
   is($str->as_pdf,$binary{$txt});
}

