require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
  end

  let(:another_user) {FactoryGirl.create(:another_user)}

  describe 'GET #index' do
    context 'with authenticated user' do
      before :each do
        login_with @user
      end
      context 'when type FOLLOWERS' do
        before do
          @type = Relationship::FOLLOWERS
          get :index, params: {type: @type}
        end
        it {
          expect(response).to render_template "users/list"
        }
        it {
          expect(assigns(:facade)).to be_a(UsersList::FollowersListFacade)
        }
      end
      context 'when type FOLLOWING' do
        before do
          @type = Relationship::FOLLOWING
          get :index, params: {type: @type}
        end
        it {
          expect(response).to render_template "users/list"
        }
        it {
          expect(assigns(:facade)).to be_a(UsersList::FollowingListFacade)
        }
      end
    end
  end

  describe 'POST #create' do
    context 'with authenticated user' do
      before :each do
        login_with @user
      end
      context 'without already relationship' do
        it {
          expect {
            post :create, params: {id: another_user.id}
          }.to change(Relationship, :count).by(1)
          expect(response).to redirect_to relationships_path(type: Relationship::FOLLOWING)
        }
        it {
          post :create, params: {id: another_user.id}
          expect(@user.following).to include(another_user)
          expect(another_user.followers).to include @user
        }
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with authenticated user' do
      before :each do
        login_with @user
        @user.follow another_user
      end
      context 'with a valid relationship' do
        it {
          expect {
            delete :destroy, params: {id: another_user}
          }.to change(Relationship, :count).by(-1)
        }
        it {
          delete :destroy, params: {id: another_user}
          expect(another_user.followers).to_not include(@user)
        }
        it {
          delete :destroy, params: {id: another_user}
          expect(@user.following).to_not include(another_user)
        }
      end
    end
  end
end
