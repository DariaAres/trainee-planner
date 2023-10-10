# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let!(:category) { create(:category) }

  describe 'DELETE /categories/:id' do
    describe 'when user in not authenticated' do
      subject(:delete_category) { delete :destroy, params: { id: category.id } }

      let(:category) { create(:category) }

      before { delete_category }

      it 'return status 302' do
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        expect(response).to redirect_to('/sign_in')
      end

      it 'delete category in the database' do
        expect { delete_category }.not_to change(Category, :count).from(1)
      end
    end

    context 'when user is authenticated' do
      subject(:delete_category) { delete :destroy, params: { id: category.id } }

      before { sign_in(user) }

      it 'sets a flash notice message' do
        delete_category
        expect(flash[:success]).to match('Category has been deleted successfully')
      end

      it 'delete category in the database' do
        expect { delete_category }.to change(Category, :count).by(-1)
      end
    end
  end
end
