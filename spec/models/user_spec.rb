# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  context 'when factory is valid' do
    it { expect(build(:user)).to be_valid }
  end

  describe 'validations' do
    let(:user) { create(:user) }

    it { expect(user).to validate_presence_of :first_name }
    it { expect(user).to validate_presence_of :email }
    it { expect(user).to validate_presence_of :password }

    describe 'email is not valid' do
      context 'when \'@\' is not present' do
        let(:user) { build(:user, email: 'example.ex') }

        it { expect(user).not_to be_valid }
      end

      context 'when unacceptable symbols are present' do
        let(:user) { build(:user, email: 'Example= Ex$ample@Exam%ple') }

        it { expect(user).not_to be_valid }
      end
    end

    describe 'email is valid' do
      let(:user) { build(:user, email: 'example@example.ex') }

      it { expect(user).to be_valid }
    end

    describe 'password length is valid' do
      it { expect(user).to validate_length_of(:password).is_at_least(6).is_at_most(20) }
    end

    describe 'password is valid' do
      let(:user) { build(:user, password: 'password') }

      it { expect(user).to be_valid }
    end
  end
end
