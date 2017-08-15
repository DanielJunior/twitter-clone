require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
  end

  subject(:tweet) {FactoryGirl.build(:tweet, user: @user)}
  let(:valid_attributes) {tweet.attributes.except('id', 'created_at', 'updated_at')}
  let(:invalid_attributes) {FactoryGirl.build(:invalid_tweet, user: @user).attributes.except('id', 'created_at', 'updated_at')}
  let(:another_user) {FactoryGirl.create(:another_user)}

  describe 'GET #index' do
    context 'with authenticated user' do
      before :each do
        login_with @user
      end
      context 'with valid user_id' do
        it {
          get :index, params: {user_id: another_user.id}
          expect(response).to render_template :index
        }
        it {
          get :index, params: {user_id: another_user.id}
          expect(assigns(:facade)).to be_a(TweetFacade)
        }
      end
      context 'without invalid user_id' do
        it {
          get :index, params: {user_id: 10000}
          expect(flash[:errors]).to_not be_empty
        }
      end
    end

  end
  describe 'POST #create' do
    context 'with authenticated user' do
      before :each do
        login_with @user
      end
      context 'with valid attributes' do
        it {
          expect {
            post :create, params: {tweet: valid_attributes}
          }.to change(Tweet, :count).by(1)
          expect(response).to redirect_to root_path
        }
        it {
          post :create, params: {tweet: valid_attributes}
          expect(assigns(:tweet)).to be_a(Tweet)
          expect(assigns(:tweet)).to be_persisted
        }
      end
      context 'without valid attributes' do
        it {
          expect {
            post :create, params: {tweet: invalid_attributes}
          }.to_not change {Tweet.count}
          expect(flash[:errors]).to_not be_empty
        }
      end
    end
    context 'without authenticated user' do
      before :each do
        login_with nil
      end
      context 'with valid attributes' do
        it {
          expect {
            post :create, params: {tweet: valid_attributes}
          }.to_not change {Tweet.count}
        }
      end
    end
  end

  describe 'PATCH #update' do
    before do
      login_with @user
      tweet.save
    end

    context 'with valid attributes' do
      it 'locates the requested @tweet' do
        patch :update, params: {id: tweet, tweet: valid_attributes}
        expect(assigns(:tweet)).to eq(tweet)
      end

      it 'changes @tweet attributes' do
        patch :update, params: {id: tweet,
                                tweet: attributes_for(:tweet,
                                                      content: 'Outro teste')}
        tweet.reload
        expect(tweet.content).to eq('Outro teste')
      end

      it 'redirects to the updated contact' do
        patch :update, params: {id: tweet, tweet: attributes_for(:tweet)}
        expect(response).to redirect_to users_path
      end
    end

    context 'with invalid attributes' do
      it {
        patch :update, params: {id: tweet, tweet: invalid_attributes}
        expect(flash[:errors]).to_not be_empty
        expect(response).to redirect_to users_path
      }
    end
  end

  describe 'DELETE #destroy' do

    before do
      login_with @user
      tweet.save
    end

    it do
      expect {
        delete :destroy, params: {id: tweet}
      }.to change(Tweet, :count).by(-1)
      expect(response).to redirect_to users_path
    end

  end
end
