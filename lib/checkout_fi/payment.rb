module Checkoutfi
  class Payment
    Normal = 1

    VALID_OPTIONS = %w[ stamp amount reference message language merchant
                        return cancel reject delayed content
                        delivery_date firstname familyname address
                        postcode postoffice password
                      ].map { |m| m.to_sym }.freeze

    DEFAULT_OPTIONS = {
                        :version => '0001',
                        :country => 'FIN',
                        :currency => 'EUR',
                        :device => 1,
                        :content => Normal,
                        :type => 0,
                        :algorithm => 1
                      }

    def initialize(opts = {})
      invalid_keys = opts.keys - VALID_OPTIONS
      if invalid_keys.size > 0
        raise ArgumentError.new('Invalid keys: #{invalid_keys.join(", ")}')
      end

      @options = DEFAULT_OPTIONS.merge(:merchant => Checkoutfi.merchant_id,
                                       :password => Checkoutfi.password).merge(opts)
    end

    def version
      options[:version]
    end

    def country
      options[:country]
    end

    def currency
      options[:currency]
    end

    def device
      options[:device]
    end

    def type
      options[:type]
    end

    def algorithm
      options[:algorithm]
    end

    private

    def options
      @options
    end

    def method_missing(method, *args)
      # check if we are setting or getting, setters end in = which is 61
      setter = method.to_s[-1] == 61
      if setter
        method = method.to_s[0...-1].to_sym
      end

      if !VALID_OPTIONS.include?(method)
        super
      else
        if setter
          options[method] = args.first
        else
          options[method]
        end
      end
    end
  end
end
