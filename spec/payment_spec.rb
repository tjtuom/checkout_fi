require 'spec_helper'

describe 'Payment' do
  include Checkoutfi::SpecHelper

  it 'can be instantiated' do
    doing { Checkoutfi::Payment.new }.should_not raise_error
  end

  before do
    @payment = Checkoutfi::Payment.new
  end

  it 'has a method id that returns -1 for rails form helper compatibility' do
    @payment.id.should == -1
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

  describe "#merchant" do
    it 'defaults to the merchant_id set for the module' do
      Checkoutfi.merchant_id = 12345
      Checkoutfi::Payment.new.merchant.should == 12345
    end
  end

  describe "#password" do
    it 'defaults to the password set for the module' do
      Checkoutfi.password = 'foobar'
      Checkoutfi::Payment.new.password.should == 'foobar'
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

  describe "#delivery_date" do
    it 'does not change strings' do
      @payment.delivery_date = 'foo'
      @payment.delivery_date.should == 'foo'
    end

    it 'formats time objects to YYYYMMDD' do
      @payment.delivery_date = Time.local(2010, 2, 1)
      @payment.delivery_date.should == '20100201'
    end

    it 'formats time objects when set via the constructor' do
      @payment = Checkoutfi::Payment.new(:delivery_date => Time.local(2010, 2, 1))
      @payment.delivery_date.should == '20100201'
    end
  end

  describe "#mac" do
    it 'raises an error if a required field is missing' do
      doing { @payment.mac }.should raise_error(ArgumentError)
    end

    it 'returns the checksum of the options' do
      @payment = payment_with_all_attributes_set
      @payment.mac.should == 'BC87FC4C91B97841F668B39985773A0D'
    end
  end
end
