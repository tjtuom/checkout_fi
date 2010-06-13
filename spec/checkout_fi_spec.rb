require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Checkoutfi do
  describe "#merchant_id" do
    it 'defaults to the test user' do
      Checkoutfi.merchant_id.should == 375917
    end

    it 'can be changed' do
      Checkoutfi.merchant_id = 123456
      Checkoutfi.merchant_id.should == 123456
    end
  end

  describe "#password" do
    it 'defaults to the test user password' do
      Checkoutfi.password.should == 'SAIPPUAKAUPPIAS'
    end

    it 'can be changed' do
      Checkoutfi.password = 'foo'
      Checkoutfi.password.should == 'foo'
    end
  end
end

