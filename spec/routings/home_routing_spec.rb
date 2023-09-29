# frozen_string_literal: true

require 'spec_helper'

describe 'Home routes path', type: :routing do
  it 'route root path to Home#index' do
    expect(get: '/').to route_to('home#index')
  end

  it 'route root path to locale en' do
    expect(get('/en')).to route_to(controller: 'home', action: 'index', locale: 'en')
  end

  it 'route root path to locale ru' do
    expect(get('/ru')).to route_to(controller: 'home', action: 'index', locale: 'ru')
  end
end
