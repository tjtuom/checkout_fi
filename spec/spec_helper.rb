require 'rubygems'

require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib checkout_fi]))

require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_view/base'
require 'action_controller'
require 'action_view/template/handlers/erb'

require 'rspec_tag_matchers'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each {|f| require f}

Spec::Runner.configure do |config|
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  config.include(RspecTagMatchers)

  # a simple helper for readability
  def doing(&block)
    block
  end
end

module Checkoutfi
  module SpecHelper
    include ActionPack
    include ActionView::Context if defined?(ActionView::Context)
    include ActionController::RecordIdentifier
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::ActiveRecordHelper if defined?(ActionView::Helpers::ActiveRecordHelper)
    include ActionView::Helpers::ActiveModelHelper if defined?(ActionView::Helpers::ActiveModelHelper)
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::AssetTagHelper
    include ActiveSupport
    include ActionController::PolymorphicRoutes if defined?(ActionController::PolymorphicRoutes)


    def self.included(base)
      base.class_eval do

        attr_accessor :output_buffer

        def protect_against_forgery?
          false
        end

      end
    end

    def payment_with_all_attributes_set
      Checkoutfi.merchant_id = 12345
      Checkoutfi.password = 'foobar'
      Checkoutfi::Payment.new(  :stamp => '1234', :amount => 1000, :reference => "1009",
                                :message => 'Foo bar.', :language => 'FI', :return => 'return',
                                :cancel => 'cancel', :reject => 'reject', :delayed => 'delayed',
                                :content => 1, :delivery_date => Time.local(2010, 2, 1), :firstname => 'Toni',
                                :familyname => 'Tuominen', :address => 'address', :postcode => '1000',
                                :postoffice => 'postoffice'
                             )
    end

    def response_with_all_attributes_set
      Checkoutfi.password = 'foobar'
      Checkoutfi::Response.new( :version => '0001', :stamp => '1234', :reference => '1009',
                                :payment => '123456', :status => '2', :algorithm => 1,
                                :mac => '594c1af45840f4e58ab4be9e562d2636')
    end

  end
end
