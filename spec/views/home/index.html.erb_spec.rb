# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  describe 'Home route path', type: :routing do
    it 'route root path to Home#index' do
      expect(get: '/home/index').to route_to('home#index')
    end
  end
end
