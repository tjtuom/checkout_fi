require 'digest/md5'

module Checkoutfi
  class Response < Struct.new(:version, :stamp, :reference, :payment, :status, :algorithm, :mac)
    OPTIONS = %w[version stamp reference payment status algorithm].map { |m| m.to_sym }.freeze
    ACCEPTABLE_STATUSES = [2,4,5,6,7,8,9,10].freeze

    def initialize(opts = {})
      opts.each do |key, value|
        key = "#{key.to_s.downcase}=".to_sym
        send key, value if respond_to?(key)
      end
    end

    def calculated_mac
      values = OPTIONS.map { |key| send(key) } << Checkoutfi.password
      Digest::MD5.hexdigest(values.join('+'))
    end

    def valid?
      mac == calculated_mac
    end

    def acceptable?
      ACCEPTABLE_STATUSES.include?(status.to_i)
    end
  end
end
