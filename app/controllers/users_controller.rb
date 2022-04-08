class UsersController < ApplicationController
  def likes
    @like_boards = current_user.like_boards
  end
end
