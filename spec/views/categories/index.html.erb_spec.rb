# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  let(:user) { create(:user) }
  let(:category_work) { create(:category, :work) }
  let(:category_rest) { create(:category, :rest) }
  let(:category_personal) { create(:category, :personal) }
  let(:user_categories) do
    create(:user_category, user:, categories: [category_personal, category_rest, category_work])
  end

  before do
    sign_in(user)
    assign(:categories, Kaminari.paginate_array([category_work, category_rest, category_personal]).page(1))
    render template: 'categories/index'
  end

  context 'when page include three categories' do
    it { expect(rendered).to have_content(t('category.categories')) }
    it { expect(rendered).to include(CGI.escapeHTML(category_work.name)) }
    it { expect(rendered).to include(CGI.escapeHTML(category_rest.name)) }
    it { expect(rendered).to include(CGI.escapeHTML(category_personal.name)) }
  end
end
