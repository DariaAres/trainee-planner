# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  let(:events) do
    Kaminari.paginate_array(create_list(:event, 21, user:, category:)).page(1)
  end
  let(:category) { create(:category, :work) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
    assign(:events, events)
    render template: 'events/index'
  end

  describe 'when more than 20 events' do
    it { expect(rendered).to have_content(t('event.events')) }
    it { expect(rendered).to have_xpath '//a[contains(text(), page-link)]' }
    it { expect(rendered).to have_xpath '//input[contains(@id, name)]' }
  end
end
