# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Admin::RedirectRulesController, type: :controller do
  # resourceful spree admin controller
  specify do
    expect(described_class.ancestors).to include(Spree::Admin::ResourceController)
  end

  specify do
    expect(controller.send(:model_class)).to eq ::RedirectRule
  end

  describe 'build_resource' do
    subject { controller.send(:build_resource) }

    it { is_expected.to be_a(RedirectRule) }
    it { is_expected.to be_active }
  end
end
