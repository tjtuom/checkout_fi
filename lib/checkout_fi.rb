module Checkoutfi
  autoload :Version, 'checkout_fi/version'

  autoload :Payment, 'checkout_fi/payment'

  class << self
    attr_accessor :merchant_id, :password

    def test_merchant_id
      375917
    end

    def test_password
      'SAIPPUAKAUPPIAS'
    end
  end
end
