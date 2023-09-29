# frozen_string_literal: true

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST /events/new' do
    context 'when user in not authenticated' do
      subject(:create_event) { post :create, params: { event: { name: event } } }

      let(:event) { create(:event) }

      before { create_event }

      it 'return status 302' do
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        expect(response).to redirect_to('/users/sign_in')
      end
    end

    context 'when event created' do
      subject(:create_event) { post :create, params: { event: { name: event } } }

      let(:event) { create(:event) }

      before do
        sign_in(user)
        create_event
      end

      it 'redirect to events_path' do
        expect(response).to redirect_to(events_path)
      end

      it 'set a flash message' do
        expect(flash[:success]).to eq('Event has been successfully created')
      end
    end

    context 'when user is not authenticated create event' do
      subject(:create_event) { post :create, params: { event: { name: event.name } } }

      let(:event) { build(:event) }

      before { sign_in(user) }

      it 'save event in the database' do
        expect { create_event }.to change(Event, :count).from(0).to(1)
      end
    end

    context 'when user is authenticated create event' do
      subject(:create_event) { post :create, params: { event: { name: event.name } } }

      let(:event) { build(:event) }

      it 'save event in the database' do
        expect { create_event }.not_to change(Event, :count).from(0)
      end
    end
  end
end
