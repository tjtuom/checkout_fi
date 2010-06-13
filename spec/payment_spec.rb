require 'spec_helper'

describe 'Payment' do

  it 'can be instantiated' do
    doing { Checkoutfi::Payment.new }.should_not raise_error
  end

  before do
    @payment = Checkoutfi::Payment.new
  end

  { :version => '0001', :country => 'FIN', :currency => 'EUR', :device => 1,
    :type => 0, :algorithm => 1 }.each do |key, default|
    describe "##{key.to_s}" do
      it "defaults to #{default}" do
        @payment.send(key).should == default
      end

      it 'cannot be set' do
        doing { @payment.send(:"#{key.to_s}=", 'foo') }.should raise_error(NoMethodError)
      end

      it 'cannot be set by the constructor' do
        doing { Checkoutfi::Payment.new(key => '1000') }.should raise_error(ArgumentError)
      end
    end
  end

  describe "#content" do
    it 'defaults to normal content' do
      @payment.content.should == Checkoutfi::Payment::Normal
      @payment.content.should == 1
    end
  end

  describe "valid options" do
    it 'can be set' do
      doing { @payment.stamp = '12345' }.should_not raise_error(NoMethodError)
    end

    it 'can be read' do
      @payment.stamp = '12345'
      @payment.stamp.should == '12345'
    end
  end

  describe "invalid options" do
    it 'raises a no method error' do
      doing { @payment.foobar = '1245' }.should raise_error(NoMethodError)
    end
  end
end
