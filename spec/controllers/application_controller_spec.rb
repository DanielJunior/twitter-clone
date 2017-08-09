require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
  end

  describe 'GET #create' do
    context 'with authenticated user' do
      before :each do
        login_with @user
      end
      it {
        get :index
        expect(response).to redirect_to users_path
      }
    end
  end
end
