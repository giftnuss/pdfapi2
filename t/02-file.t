use Test::More tests => 5;
# Abstract: tests for one of the main classes here PDF::API2::Basic::PDF::File

use warnings;
use strict;

use IO::String;

my $tc;

BEGIN {
  $tc = 'PDF::API2::Basic::PDF::File';
  use_ok($tc);
};

# constructor new is for creating new, empty file objects
my $emptyfile = $tc->new;

isa_ok($emptyfile->{'Root'},'PDF::API2::Basic::PDF::Dict');
isa_ok($emptyfile->{'Root'}->{'Type'},'PDF::API2::Basic::PDF::Name');
is($emptyfile->{'Root'}->{'Type'}->{'val'},'Catalog','root dict name');

# version - check malformed version
my $malformed = IO::String->new("KLF-1.9\nnix\n%EOF");
eval {
   my $null = $tc->open($malformed);
};
like("$@",qr[ not a PDF file version 1.x],
   "throw error when malformed header line found");



