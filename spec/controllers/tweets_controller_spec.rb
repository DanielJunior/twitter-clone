require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  let(:valid_attributes) {FactoryGirl.attributes_for :tweet}
  subject(:tweet) {FactoryGirl.create :tweet}

  # describe 'POST #create' do
  #   context 'with valid attributes' do
  #     it 'create a new Tweet' do
  #       expect {
  #         post :create, params: {tweet: valid_attributes}
  #       }.to change(Tweet, :count).by(1)
  #     end
  #     # it 'atribui um novo documento para @tweet' do
  #     #   post :create, params: {tweet: valid_attributes}
  #     #   expect(assigns(:tweet)).to be_a(Tweet)
  #     #   expect(assigns(:tweet)).to be_persisted
  #     # end
  #   end
  # end
  #
  # describe 'PUT #update' do
  #
  # end
end
