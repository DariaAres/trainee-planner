# frozen_string_literal: true

require 'rails_helper'
require 'factories/events'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET /event/:id' do
    subject(:edit_event) { get :edit, params: { id: event.id } }

    let(:user) { create(:user) }
    let(:event) { create(:event) }

    context 'when user is not authenticated' do
      it 'return status 302' do
        edit_event
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        edit_event
        expect(response).to redirect_to('/sign_in')
      end
    end

    context 'when user is authenticated' do
      before do
        sign_in(user)
        edit_event
      end

      it 'return status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template('edit')
      end

      it 'assigns @event' do
        expect(assigns(:event)).to eq(event)
      end
    end
  end
end
