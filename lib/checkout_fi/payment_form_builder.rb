module Checkoutfi
  class PaymentFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper

    def payment_fields
      fields = Payment::OPTION_ORDER - [:password] + [:mac]
      fields.map do |key|
        value = object.send(key)
        hidden_field_tag(key.to_s.upcase, value, :id => nil) if value
      end.join("\n")
    end

  end
end
