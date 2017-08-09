require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user, email: 'test@test.com')}
  subject(:relationship) {Relationship.new(follower_id: user1.id,
                                           followed_id: user2.id)}

  describe 'validations' do
    context 'with follower and followed' do
      it {is_expected.to be_valid}
    end
    context 'without follower' do
      before do
        relationship.follower = nil
      end
      it{is_expected.to_not be_valid}
    end
    context 'without followed' do
      before do
        relationship.followed = nil
      end
      it{is_expected.to_not be_valid}
    end
  end
end
