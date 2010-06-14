module Checkoutfi
  module FormHelper
    def payment_form_for(payment_object, *args, &block)
      options = args.extract_options!
      options[:builder] ||= PaymentFormBuilder
      options[:url] ||= "https://payment.checkout.fi"

      form_for(payment_object, *(args << options), &block)
    end
  end
end
