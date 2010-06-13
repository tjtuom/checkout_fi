require 'spec_helper'

describe 'Payment' do
  it 'can be instantiated' do
    doing { Checkoutfi::Payment.new }.should_not raise_error
  end
end
