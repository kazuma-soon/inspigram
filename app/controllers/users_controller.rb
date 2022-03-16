class UsersController < ApplicationController
  def likes
    # @like_boards = []

    ## SQLのパフォーマンスがダメ has_many through source で改善
    # current_user.favorite_boards.each do |like_board|
    #   @like_boards << Board.find(like_board[:board_id])
    # end
    # @like_boards
    
    @like_boards = current_user.like_boards
  end
end
