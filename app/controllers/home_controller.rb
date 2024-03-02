class HomeController < ApplicationController
  def index
    if Creator.exists?(user_id: current_user)
      @is_creator = true
      @creator = Creator.find_by(user_id: current_user)
    else
      @is_creator = false
    end
  end
end
