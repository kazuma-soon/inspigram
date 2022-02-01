class UsersController < ApplicationController
  def likes
    @like_boards = []
    
    current_user.favorite_boards.each do |like_board|
      @like_boards << Board.find(like_board[:board_id])
    end
    @like_boards
  end
end
