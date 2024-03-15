# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_header.html.erb', type: :view do
  describe 'Home route path', type: :routing do
    before { render template: 'layouts/application' }

    it 'include header text' do
      expect(rendered).to include('button', t('nav.language'))
    end
  end
end
