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
      # it {expect(assigns(:user)).to be_a(User)}
      # it {expect(assigns(:user)).to eq(user)}
    end
  end
end
