# frozen_string_literal: true

describe 'Events routes path', type: :routing do
  let(:event) { create(:event, user:, category:) }
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  it 'routes Events#index' do
    expect(get('/events')).to route_to(controller: 'events', action: 'index')
  end

  it 'routes Events#create' do
    expect(post('/events')).to route_to(controller: 'events', action: 'create')
  end

  it 'routes Events#show' do
    expect(get("/events/#{event.id}")).to route_to(controller: 'events', action: 'show', id: event.id.to_s)
  end

  it 'routes Events#destroy' do
    expect(delete("/events/#{event.id}")).to route_to(controller: 'events', action: 'destroy', id: event.id.to_s)
  end

  it 'routes Events#update' do
    expect(patch("/events/#{event.id}")).to route_to(controller: 'events', action: 'update', id: event.id.to_s)
  end
end
