# frozen_string_literal: true

require 'rails_helper'
require 'factories/categories'

RSpec.describe 'Categories', type: :routing do
  describe 'Categories routes path' do
    let(:category) { create(:category) }

    it 'routes root path to Categories#index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes root path to Categories#create' do
      expect(post: '/categories').to route_to(controller: 'categories',
                                              action: 'create')
    end

    it 'routes root path to Categories#update' do
      expect(patch: "/categories/#{category.id}").to route_to(controller: 'categories',
                                                              action: 'update',
                                                              id: category.id.to_s)
    end

    it 'routes Categories#destroy' do
      expect(delete: "/categories/#{category.id}").to route_to(controller: 'categories',
                                                               action: 'destroy',
                                                               id: category.id.to_s)
    end
  end
end
