require 'rails_helper'

describe TweetFacade do
  let(:user) {FactoryGirl.create(:user)}
  let(:another_user) {FactoryGirl.create(:another_user)}

  subject(:tweet_facade) {TweetFacade.new user, another_user.id}

  describe 'methods' do
    describe '.tweets' do
      context 'when initilized with a valid user_id' do
        it {
          expect(tweet_facade.tweets).to match_array(another_user.tweets)
        }
      end
      context 'when initilized without a valid user_id' do
        before do
          tweet_facade.user = nil
        end
        it {
          expect(tweet_facade.tweets).to be nil
        }
      end
    end

    describe '.title' do
      context 'when initilized with a valid user_id' do
        context 'when not current_user' do
          it {
            expect(tweet_facade.title).to eq "Tweets from #{another_user.name}"
          }
        end
        context 'when current_user' do
          before do
            tweet_facade.user = user
          end
          it {
            expect(tweet_facade.title).to eq "My tweets:"
          }
        end
      end
    end

    describe '.errors' do
      context 'when with errors' do
        before do
          tweet_facade.user = nil
        end
        it {
          expect(tweet_facade.errors).to_not be_empty
        }
      end
      context 'when without errors' do
        it {
          expect(tweet_facade.errors).to be nil
        }
      end
    end
  end


end