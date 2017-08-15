module UsersList

  class UsersListFacade
    attr_reader :user
    attr_accessor :query

    def initialize user_id, query=nil
      @user = User.find(user_id)
      @query = query
    end

    def results
      nil
    end

    def not_found_title
      "No users found!"
    end

    def title
      "Users found:"
    end
  end

  class SearchListFacade < UsersListFacade

    def results
      User.find_by_fuzzy_name(@query) unless @query.blank?
    end

    def not_found_title
      "No results for your search!"
    end

    def title
      "Results for search: "
    end
  end

  class FollowersListFacade < UsersListFacade
    def results
      @user.followers
    end

    def not_found_title
      "No followers found!"
    end

    def title
      "Followers: "
    end
  end

  class FollowingListFacade < UsersListFacade
    def results
      @user.following
    end

    def not_found_title
      "No following found!"
    end

    def title
      "Following: "
    end
  end

  SPECIALIZED_CLASSES = {
      "search": SearchListFacade,
      "followers": FollowersListFacade,
      "following": FollowingListFacade
  }

  def self.facade_for(name, current_user, query=nil)
    SPECIALIZED_CLASSES[name.to_sym].new current_user, query
  end

end