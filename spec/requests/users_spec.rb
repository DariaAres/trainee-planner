# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /user' do
    it 'returns http success' do
      get '/users/user'
      expect(response).to have_http_status(:success)
    end
  end
end