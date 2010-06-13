require 'spec_helper'

describe 'Payment' do

  it 'can be instantiated' do
    doing { Checkoutfi::Payment.new }.should_not raise_error
  end

  before do
    @payment = Checkoutfi::Payment.new
  end

  describe "#version" do
    it 'defaults to 0001' do
      @payment.version.should == '0001'
    end

    it 'cannot be set' do
      doing { @payment.version = 'foo' }.should raise_error(NoMethodError)
    end

    it 'cannot be set by the constructor' do
      doing { Checkoutfi::Payment.new(:version => '1000') }.should raise_error(ArgumentError)
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
