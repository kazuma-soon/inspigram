class UsersController < ApplicationController
  def likes
    @like_boards = current_user.react_boards
  end
end
