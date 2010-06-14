require 'spec_helper'
require 'checkout_fi/form_helper'

describe "PaymentFormBuilder" do
  include Checkoutfi::SpecHelper
  include Checkoutfi::FormHelper

  before do
    @output_buffer = ''
  end

  describe "#payment_fields" do
    before do
      @payment = payment_with_all_attributes_set
      payment_form_for(@payment) do |builder|
        concat(builder.payment_fields)
      end
    end

    it 'creates hidden inputs for every set property' do
      # I'm too lazy to test for all
      output_buffer.should have_tag("form input[@type='hidden'][@name='AMOUNT'][@value='1000']")
    end

    it 'does not create inputs for unspecified properties' do
      @payment.message = nil
      @output_buffer = ''
      payment_form_for(@payment) do |builder|
        concat(builder.payment_fields)
      end
      output_buffer.should_not have_tag("form input[@name='MESSAGE']")
    end

    it 'does not include the password input' do
      output_buffer.should_not have_tag("form input[@name='PASSWORD']")
    end

    it 'includes the checksum field' do
      output_buffer.should have_tag("form input[@name='MAC']")
    end
  end
end
