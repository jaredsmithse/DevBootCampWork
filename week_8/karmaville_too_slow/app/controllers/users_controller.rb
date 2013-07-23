class UsersController < ApplicationController
  def index
    @users = User.order('karma DESC').limit(50)
  end
end
