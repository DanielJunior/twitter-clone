require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:user) { FactoryGirl.create(:user)}
  subject(:tweet) {FactoryGirl.build(:tweet, user: user)}

  describe 'validations' do

    describe 'content' do
      context 'when present' do
        before do
          tweet.valid?
        end
        it {is_expected.to be_valid}
        it {expect(tweet.errors[:content]).to_not include("can't be blank")}

        context 'when greater than 140 characteres' do
          before do
            tweet.content = Faker::Lorem.paragraph(10)
            tweet.valid?
          end
          it {is_expected.to_not be_valid}
          it {expect(tweet.errors[:content]).to include("is too long (maximum is 140 characters)")}
        end
      end

      context 'when not present' do
        before do
          tweet.content = nil
          tweet.valid?
        end
        it {is_expected.to_not be_valid}
        it {expect(tweet.errors[:content]).to include("can't be blank")}
      end
    end

    describe 'user' do
      context 'when present' do
        before do
          tweet.valid?
        end
        it {is_expected.to be_valid}
        it {expect(tweet.errors[:user]).to_not include("can't be blank")}
      end
      context 'when not present' do
        before do
          tweet.user = nil
          tweet.valid?
        end
        it {is_expected.to_not be_valid}
        it {expect(tweet.errors[:user]).to include("can't be blank")}
      end
    end

  end
end
