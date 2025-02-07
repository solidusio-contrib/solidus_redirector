# frozen_string_literal: true

require 'redirector'

module Spree
  module Admin
    class RedirectRulesController < ResourceController
      protected
      def model_class
        ::RedirectRule
      end

      def build_resource
        model_class.new({active: true})
      end
    end
  end
end
