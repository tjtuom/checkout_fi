module Checkoutfi
  module FormHelper
    def payment_form_for(payment_object, *args, &block)
      options = args.extract_options!
      options[:html] ||= {}
      options[:builder] ||= PaymentFormBuilder
      options[:url] ||= "https://payment.checkout.fi"
      options[:html][:method] ||= "post"

      form_for(payment_object, *(args << options), &block)
    end
  end
end
