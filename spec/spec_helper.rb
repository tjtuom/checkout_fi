require 'rubygems'

require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib checkout_fi]))

gem 'activesupport', '2.3.5'
gem 'actionpack', '2.3.5'
require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'

Spec::Runner.configure do |config|
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # a simple helper for readability
  def doing(&block)
    block
  end
end

module Checkoutfi
  module SpecHelper
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::ActiveRecordHelper
    include ActionView::Helpers::RecordIdentificationHelper
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::AssetTagHelper
    include ActiveSupport
    include ActionController::PolymorphicRoutes

    def self.included(base)
      base.class_eval do

        attr_accessor :output_buffer

        def protect_against_forgery?
          false
        end

      end
    end

  end
end
