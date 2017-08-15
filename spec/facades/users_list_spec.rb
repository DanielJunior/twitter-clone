require 'rails_helper'

describe UsersList do

  let(:user) {FactoryGirl.create(:user)}
  let(:another_user) {FactoryGirl.create(:another_user)}

  describe 'methods' do
    describe 'self.facade_for' do
      context 'with search argument' do
        it {expect(UsersList.facade_for "search", user).to be_a(UsersList::SearchListFacade)}
      end
      context 'with followers argument' do
        it {expect(UsersList.facade_for "followers", user).to be_a(UsersList::FollowersListFacade)}
      end
      context 'with following argument' do
        it {expect(UsersList.facade_for "following", user).to be_a(UsersList::FollowingListFacade)}
      end
    end
  end

  describe UsersList::UsersListFacade do
    let(:users_list_facade) {UsersList::UsersListFacade.new user.id}

    describe 'methods' do
      describe '.not_found_title' do
        it {expect(users_list_facade.not_found_title).to eq "No users found!"}
      end
      describe '.title' do
        it {expect(users_list_facade.title).to eq "Users found:"}
      end
    end
  end

  describe UsersList::SearchListFacade do
    let(:search_list_facade) {UsersList::SearchListFacade.new user.id, user.name}

    describe 'methods' do

      describe '.results' do
        context 'with a valid query' do
          context 'with results available' do
            it {expect(search_list_facade.results).to_not be_empty}
          end
          context 'with no results available' do
            before do
              search_list_facade.query="kkkk"
            end
            it {expect(search_list_facade.results).to be_empty}
          end
        end
        context 'with a invalid query' do
          before do
            search_list_facade.query=nil
          end
          it {expect(search_list_facade.results).to be nil}
        end
      end
      describe '.not_found_title' do
        it {expect(search_list_facade.not_found_title).to eq "No results for your search!"}
      end
      describe '.title' do
        it {expect(search_list_facade.title).to eq "Results for search: "}
      end
    end
  end

  describe UsersList::FollowersListFacade do
    let(:followers_list_facade) {UsersList::FollowersListFacade.new user.id}
    before do
      user.follow another_user
      another_user.follow user
    end

    describe 'methods' do
      describe '.not_found_title' do
        it {expect(followers_list_facade.not_found_title).to eq "No followers found!"}
      end
      describe '.title' do
        it {expect(followers_list_facade.title).to eq "Followers: "}
      end
      describe '.results' do
        it {expect(followers_list_facade.results).to match_array user.followers}
      end
    end
  end

  describe UsersList::FollowingListFacade do
    let(:following_list_facade) {UsersList::FollowingListFacade.new user.id}
    before do
      user.follow another_user
      another_user.follow user
    end

    describe 'methods' do
      describe '.not_found_title' do
        it {expect(following_list_facade.not_found_title).to eq "No following found!"}
      end
      describe '.title' do
        it {expect(following_list_facade.title).to eq "Following: "}
      end
      describe '.results' do
        it {expect(following_list_facade.results).to match_array user.following}
      end
    end
  end

end