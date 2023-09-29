# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users routings', type: :routing do
  it 'path to sign up' do
    expect(get('/sign_up')).to route_to(controller: 'users/registrations', action: 'new')
  end

  it 'path to sign in' do
    expect(get('/sign_in')).to route_to(controller: 'devise/sessions', action: 'new')
  end

  it 'path to edit' do
    expect(get('/edit')).to route_to(controller: 'users/registrations', action: 'edit')
  end
end
