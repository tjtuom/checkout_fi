require 'spec_helper'
require 'checkout_fi/form_helper'

describe "FormHelper" do
  include Checkoutfi::SpecHelper
  include Checkoutfi::FormHelper

  before do
    @output_buffer = ''
  end

  describe "#payment_form_for" do
    it 'yields an instance of PaymentFormBuilder' do
      payment_form_for(::Checkoutfi::Payment.new) do |builder|
        builder.class.should == ::Checkoutfi::PaymentFormBuilder
      end
    end
  end

end
