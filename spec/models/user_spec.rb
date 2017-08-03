require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) {FactoryGirl.build :user}

  describe 'validations' do

    describe 'name' do
      context 'when present' do
        before do
          user.valid?
        end
        it {is_expected.to be_valid}
        it {expect(user.errors[:name]).to_not include("can't be blank")}

      end
      context 'when not present' do
        before do
          user.name = nil
          user.valid?
        end
        it {is_expected.to_not be_valid}
        it {expect(user.errors[:name]).to include("can't be blank")}
      end
    end

    describe 'description' do
      context 'when present' do
        before do
          user.valid?
        end
        it {is_expected.to be_valid}
        it {expect(user.errors[:description]).to_not include("can't be blank")}

      end
      context 'when not present' do
        before do
          user.description = nil
          user.valid?
        end
        it {is_expected.to_not be_valid}
        it {expect(user.errors[:description]).to include("can't be blank")}

      end
    end

    describe 'email' do
      context 'when present' do
        before do
          user.valid?
        end
        it {is_expected.to be_valid}
        it {expect(user.errors[:email]).to_not include("can't be blank")}

        context 'when duplicated' do
          before do
            u1 = FactoryGirl.create :user
            @u2 = FactoryGirl.build :user, {email: u1.email}
            @u2.valid?
          end
          it{expect(@u2).to_not be_valid}
          it {expect(@u2.errors[:email]).to include("has already been taken")}
        end
      end

      context 'when not present' do
        before do
          user.email = nil
          user.valid?
        end
        it {is_expected.to_not be_valid}
        it {expect(user.errors[:email]).to include("can't be blank")}
      end
    end

    describe 'avatar' do
      context 'when present' do
        it{is_expected.to be_valid}
      end
    end
  end
end
