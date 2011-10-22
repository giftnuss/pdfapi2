
use strict;
use warnings;

use Test::More::Behaviour;

# first test ported from ruby prawn project ;)

=pod ruby

describe "When creating destinations" do
 
  before(:each) { create_pdf }
  
  it "should add entry to Dests name tree" do
    @pdf.dests.data.empty?.should == true
    @pdf.add_dest "candy", "chocolate"
    @pdf.dests.data.size.should == 1
  end

end

=cut

use PDF::API2::Test::More;
use PDF::API2::Test::Helper;

sub before_each { new_pdf() }

describe 'named destination' => sub {

  context 'creating new named destination' => sub {

    it 'check pdf api2 default object' => sub {
       ok(!defined pdf()->{catalog}->{Names},'destinaton dict is undefined');
    };

    it 'should add entry to destinations dict' => sub {
       pdf()->named_destination('first','one');
       ok(defined root()->{Names},'destination dict is defined');
       is_pdf_dict(root()->{Names},'destination dictionary is a dict');
       my @names = keys %{root()->{Names}->{'first'}->{-vals}};
       is(0+@names,1,'one entry in the destination dictionary');
       is($names[0],'one','entry name');
    };
  };
};

done_testing();
