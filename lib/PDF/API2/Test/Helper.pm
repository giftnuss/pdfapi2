package PDF::API2::Test::Helper;
use strict;
use warnings;

use PDF::API2;
use base 'Exporter';

our @EXPORT = qw/pdf new_pdf root/;

{ 
  my $pdf = PDF::API2->new;

  sub pdf {
    return $pdf;
  }

  sub new_pdf {
    $pdf = PDF::API2->new(@_);
  }

  sub root {
    return pdf()->{catalog};
  }
}

1;
