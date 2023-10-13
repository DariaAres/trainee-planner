# frozen_string_literal: true

require 'rails_helper'
require 'factories/events'

RSpec.describe Event, type: :model do
  subject(:event) { build(:event) }

  context 'when event is valid' do
    it { expect(event).to be_valid }
  end

  describe 'validations' do
    describe 'presence of name and date' do
      it { expect(event).to validate_presence_of :name }
      it { expect(event).to validate_presence_of :event_date }
    end

    describe 'date is valid' do
      let(:event) { build(:event, event_date: Date.tomorrow) }

      it { expect(event).to be_valid }
    end

    describe 'date is in the past' do
      let(:event) { build(:event, event_date: Date.yesterday) }

      it { expect(event).not_to be_valid }

      it 'event error equals its message' do
        event.validate

        expect(event.errors[:event_date]).to eq ['Date cannot be in the past']
      end
    end

    describe 'date_to_notificate is valid' do
      let(:event) { build(:event, event_date: Date.tomorrow + 1, date_to_notificate: Date.tomorrow) }

      it { expect(event).to be_valid }
    end

    describe 'date_to_notificate greater than date' do
      let(:event) { build(:event, event_date: Date.tomorrow + 1, date_to_notificate: Date.tomorrow + 2) }

      it { expect(event).not_to be_valid }

      it 'event error equals its message' do
        event.validate

        expect(event.errors[:date_to_notificate]).to eq ['Mention of events cannot be later than their date']
      end
    end

    describe 'date_to_notificate in the past' do
      let(:event) { build(:event, event_date: Date.tomorrow, date_to_notificate: Date.yesterday) }

      it { expect(event).not_to be_valid }

      it 'event error equals its message' do
        event.validate

        expect(event.errors[:date_to_notificate]).to eq ['Mention of events cannot be in the past']
      end
    end
  end

  describe 'associations' do
    it { expect(event).to belong_to(:user) }
    it { expect(event).to belong_to(:category) }
  end

  describe 'traits' do
    context 'when event with description' do
      let(:event) { build(:event, :with_descriprition) }

      it { expect(event.description).to be_a(String) }
    end

    context 'when event with date_to_notificate' do
      let(:event) { build(:event, :with_date_to_notificate) }

      it { expect(event.date_to_notificate).to eql(event.event_date - 1.minute) }
    end
  end
end
