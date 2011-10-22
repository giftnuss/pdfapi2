package PDF::API2::Test::More;
use strict;
use warnings;

use base 'Test::Builder::Module';

my (@types,@typesubs);
BEGIN: {
  @types = qw/array dict name string/;
  @typesubs = map { "is_pdf_${_}" } @types;
};

use subs (@typesubs);

our @EXPORT = (@typesubs);

{ 
  my $CLASS = __PACKAGE__;

  {
    no strict 'refs';
    for my $idx (0..$#types) {
      my $type = $types[$idx];
      my $subname = $typesubs[$idx];
      my $typeclass = 'PDF::API2::Basic::PDF::' . ucfirst($type);

      *{$subname} = sub ($;$) {
        my $tb = $CLASS->builder;
        my $object = shift;
        return $tb->ok(0,@_) unless ref $object;
        return $tb->ok($object->isa('PDF::API2::Basic::PDF::Dict'),@_);
      };
    }
  }
}

1;
