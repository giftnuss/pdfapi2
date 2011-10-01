use Test::More tests => 9;

use warnings;
use strict;

my $class;
BEGIN {
  $class = 'PDF::API2::Basic::PDF::Array';
  use_ok($class);
};

use PDF::API2::Basic::PDF::Utils;

my $obj = $class->new;
isa_ok($obj,$class);

my @methods = qw/outobjdeep add_elements removeobj elementsof val
  copy uid release realise outobj empty merge is_obj/;

my @missing = grep {!$obj->can($_)} @methods;
ok(@missing == 0,"methods defined - @missing");

is($obj->uid,"pdfuid000","uid counter starts with pdfuid000");

my $one = PDFNum(1);

$obj->add_elements($one);

ok(@{$obj->{' val'}} == 1,"array contains one object");

$obj->removeobj($one);

is_deeply($obj->val,[],'val is now empty');

my $copy = $obj->copy;
isnt($copy->uid,$obj->uid,"uid of copy differs from original");

is_deeply($obj->{' val'},$copy->{' val'},"val is copied");

$obj->add_elements(undef);
is_deeply($obj->{' val'},$copy->{' val'},"undef is not added");
