class UsersController < ApplicationController
  def likes
    @like_boards = []

    # 繰り返しがやばすぎる　joinを使う includeは違う　見直し has_many through
    current_user.favorite_boards.each do |like_board|
      @like_boards << Board.find(like_board[:board_id])
    end
    @like_boards
  end
end
