# frozen_string_literal: true

require 'rails_helper'
require 'factories/categories'

RSpec.describe 'Categories', type: :routing do
  describe 'Categories routes path' do
    let(:category) { create(:category) }

    it 'routes root path to Categories#index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes root path to Categories#edit' do
      expect(get: "/categories/#{category.id}/edit").to route_to(controller: 'categories',
                                                                 action: 'edit',
                                                                 id: category.id.to_s)
    end

    it 'routes root path to Categories#new' do
      expect(get: '/categories/new').to route_to(controller: 'categories',
                                                 action: 'new')
    end
  end
end
