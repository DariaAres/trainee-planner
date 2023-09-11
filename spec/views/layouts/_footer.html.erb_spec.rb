# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_footer.html.erb', type: :view do
  describe 'Home route path', type: :routing do
    before { render template: 'layouts/application' }

    it 'include footer text' do
      expect(rendered).to include('h6', '© 2023 Copyright')
    end
  end
end
