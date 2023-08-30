# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'main/home.html.erb', type: :view do
  describe 'Home route path', type: :routing do
    it 'route root path to Main#home' do
      expect(get: '/main/home').to route_to('main#home')
    end
  end
end
