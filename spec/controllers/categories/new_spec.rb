# frozen_string_literal: true

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST /categories/new' do
    context 'when user in not authenticated' do
      subject(:create_category) { post :create, params: { category: { name: category } } }

      let(:category) { create(:category, :rest) }

      before { create_category }

      it 'return status 302' do
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        expect(response).to redirect_to('/sign_in')
      end
    end

    context 'when category created' do
      subject(:create_category) { post :create, params: { category: { name: category } } }

      let(:category) { create(:category) }

      before do
        sign_in(user)
        create_category
      end

      it 'redirect to categories_path' do
        expect(response).to redirect_to(categories_path)
      end

      it 'set a flash message' do
        expect(flash[:success]).to eq('Category has been successfully created')
      end
    end

    context 'when user is not authenticated create category' do
      subject(:create_category) { post :create, params: { category: { name: category.name } } }

      let(:category) { build(:category) }

      before { sign_in(user) }

      it 'save category in the database' do
        expect { create_category }.to change(Category, :count).from(0).to(1)
      end
    end

    context 'when user is authenticated create category' do
      subject(:create_category) { post :create, params: { category: { name: category.name } } }

      let(:category) { build(:category) }

      it 'save category in the database' do
        expect { create_category }.not_to change(Category, :count).from(0)
      end
    end
  end
end
