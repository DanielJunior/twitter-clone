require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}

  describe 'GET #show' do
    before do
      login_with user
      get :show, params: {id: user.id}
    end
    context 'with valid user_id' do
      it {expect(response).to render_template('show')}
      it {expect(assigns(:user)).to be_a(User)}
      it {expect(assigns(:user)).to eq(user)}
    end
  end

  describe 'GET #index' do
    before do
      login_with user
      get :index, params: {id: user.id}
    end
    context 'with valid user_id' do
      it {expect(response).to render_template('index')}
      it {expect(assigns(:facade)).to be_a(UserDashboardFacade)}
    end
  end

  describe 'GET #search' do
    before do
      login_with user
      get :search, params: {q: user.name}
    end
    context 'with valid search query' do
      it {expect(response).to render_template('users/list')}
      it {expect(assigns(:facade)).to be_a(UsersList::SearchListFacade)}
    end
  end
end
