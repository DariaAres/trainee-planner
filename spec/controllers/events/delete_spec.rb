# frozen_string_literal: true

require 'rails_helper'
require 'factories/events'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let!(:event) { create(:event) }

  describe 'DELETE /events/:id' do
    describe 'when user in not authenticated' do
      subject(:delete_event) { delete :destroy, params: { id: event.id } }

      let(:event) { create(:event) }

      before { delete_event }

      it 'return status 302' do
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        expect(response).to redirect_to('/users/sign_in')
      end

      it 'delete category in the database' do
        expect { delete_event }.not_to change(Event, :count).from(1)
      end
    end

    context 'when user is authenticated' do
      subject(:delete_event) { delete :destroy, params: { id: event.id } }

      before { sign_in(user) }

      it 'sets a flash notice message' do
        delete_event
        expect(flash[:success]).to match('Event has been successfully deleted')
      end

      it 'delete category in the database' do
        expect { delete_event }.to change(Event, :count).by(-1)
      end
    end
  end
end
