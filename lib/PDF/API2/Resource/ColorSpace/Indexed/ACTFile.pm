package PDF::API2::Resource::ColorSpace::Indexed::ACTFile;

BEGIN {

    use strict;
    use vars qw(@ISA);
    use PDF::API2::Resource::ColorSpace::Indexed;
    use PDF::API2::Basic::PDF::Utils;
    use PDF::API2::Util;
    use Math::Trig;

    @ISA = qw( PDF::API2::Resource::ColorSpace::Indexed );

}

no warnings qw[ deprecated recursion uninitialized ];

=head1 NAME

PDF::API2::Resource::ColorSpace::Index::ACTFile

=head1 METHODS

=over

=item $cs = PDF::API2::Resource::ColorSpace::Indexed::ACTFile->new $pdf, $actfile

Returns a new colorspace object created from an adobe color table file (ACT/8BCT).
See
Adobe Photoshop� 6.0 --
File Formats Specification Version 6.0 Release 2,
November 2000
for details.

=cut

sub new {
    my ($class,$pdf,$file)=@_;
    die "could not find act-file '$file'." unless(-f $file);
    $class = ref $class if ref $class;
    $self=$class->SUPER::new($pdf,pdfkey());
    $pdf->new_obj($self) unless($self->is_obj($pdf));
    $self->{' apipdf'}=$pdf;
    my $csd=PDFDict();
    $pdf->new_obj($csd);
    $csd->{Filter}=PDFArray(PDFName('FlateDecode'));

    $csd->{WhitePoint}=PDFArray(map {PDFNum($_)} (0.95049, 1, 1.08897));
    $csd->{BlackPoint}=PDFArray(map {PDFNum($_)} (0, 0, 0));
    $csd->{Gamma}=PDFArray(map {PDFNum($_)} (2.22218, 2.22218, 2.22218));

    my $fh;
    open($fh,$file);
    binmode($fh,':raw');
    read($fh,$csd->{' stream'},768);
    close($fh);

    $csd->{' stream'}.="\x00" x 768;
    $csd->{' stream'}=substr($csd->{' stream'},0,768);

    $self->add_elements(PDFName('DeviceRGB'),PDFNum(255),$csd);
    $self->{' csd'}=$csd;

    return($self);
}

=item $cs = PDF::API2::Resource::ColorSpace::Indexed->new_api $api, $name

Returns a indexed color-space object. This method is different from 'new' that
it needs an PDF::API2-object rather than a Text::PDF::File-object.

=cut

sub new_api {
    my ($class,$api,@opts)=@_;

    my $obj=$class->new($api->{pdf},@opts);
    $self->{' api'}=$api;

    return($obj);
}

1;

__END__

=back

=head1 AUTHOR

Alfred Reibenschuh

=cut
