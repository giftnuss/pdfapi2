package PDF::API2::Content::Text;

use warnings;
use strict;

use base 'PDF::API2::Content';

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(@_);
    $self->textstart();
    return $self;
}

1;
