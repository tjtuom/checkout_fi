module Checkoutfi
  module FormHelper
    def payment_form_for(payment_object, *args, &block)
      options = args.extract_options!
      options[:html] ||= {}
      options[:builder] ||= PaymentFormBuilder
      options[:url] ||= "https://payment.checkout.fi"
      options[:html][:method] ||= "post"
      options[:html][:class] ||= 'checkoutfi_payment'
      options[:html][:id] ||= nil

      form_for(payment_object, *(args << options), &block)
    end
  end
end
