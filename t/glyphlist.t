
use strict;
use warnings;

use Test::More tests => 6;
use FindBin;

BEGIN {
  use_ok("PDF::API2::Resource::Glyphs");
};

eval {
  PDF::API2::Resource::Glyphs::_generate('doesnotexist.txt');
};

ok($@,"dies when file is not readable");

my $glyphlist = "$FindBin::Bin/../lib/PDF/API2/Resource/uniglyph.txt";

ok(-r $glyphlist,"glyphlist is readable");

my $generatedcode;
open my $out, ">",\$generatedcode;

my $origout = select($out);
PDF::API2::Resource::Glyphs::_generate($glyphlist);
select($origout);

eval "package T::Glyphs;$generatedcode";

ok(!$@,"generated code is valid - $@");

is_deeply(\%PDF::API2::Resource::Glyphs::u2n,\%T::Glyphs::u2n,
    "\%u2n hash is in sync with glyphlist");

is_deeply(\%PDF::API2::Resource::Glyphs::n2u,\%T::Glyphs::n2u,
    "\%n2u hash is in sync with glyphlist");
