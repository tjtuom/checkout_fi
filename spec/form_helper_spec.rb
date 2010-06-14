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

    it 'sets the :url to https://payment.checkout.fi' do
      payment_form_for(::Checkoutfi::Payment.new) do |builder|

      end
      output_buffer.should have_tag("form[@action='https://payment.checkout.fi']")
    end

    it 'sets the :method to post' do
      payment_form_for(::Checkoutfi::Payment.new) do |builder|
      end
      output_buffer.should have_tag("form[@method='post']")
      output_buffer.should_not have_tag("form input[@name='_method']")
    end
  end

end
