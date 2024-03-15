# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET /category/:id' do
    subject(:edit_category) { get :edit, params: { id: category.id } }

    let(:user) { create(:user) }
    let(:category) { create(:category) }

    context 'when user is not authenticated' do
      it 'return status 302' do
        edit_category
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        edit_category
        expect(response).to redirect_to('/sign_in')
      end
    end

    context 'when user is authenticated' do
      before do
        sign_in(user)
        edit_category
      end

      it 'return status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template('edit')
      end

      it 'assigns @category' do
        expect(assigns(:category)).to eq(category)
      end
    end
  end
end
