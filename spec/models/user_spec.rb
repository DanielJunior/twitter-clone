require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) {FactoryGirl.build :user}

  describe 'validations' do
    context 'when has name' do
      it {is_expected.to be_valid}
    end
    context 'when does not have name' do
      before do
        user.name = nil
      end
      it {is_expected.to_not be_valid}
    end
    context 'when has description' do
      it {is_expected.to be_valid}
    end
    context 'when does not have description' do
      before do
        user.description = nil
      end
      it {is_expected.to_not be_valid}
    end
  end
end
