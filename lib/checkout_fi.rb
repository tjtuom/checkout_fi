module Checkoutfi
  autoload :Version, 'checkout_fi/version'

  autoload :Payment, 'checkout_fi/payment'

  class << self
    attr_writer :merchant_id, :password

    def merchant_id
      @merchant_id || 375917
    end

    def password
      @password || 'SAIPPUAKAUPPIAS'
    end
  end
end
