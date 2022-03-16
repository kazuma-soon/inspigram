class TopController < ApplicationController
  skip_before_action :check_logged_in, only: %i[index guest_index]

  def index
    # 人気ランキングの取得
    @boards = Board.find(Reaction.where(status: 'like').group(:board_id).order('count(board_id) desc').limit(6).pluck(:board_id))
  end

  def guest_index
    @all_boards = Board.all.order(created_at: :desc)
  end
end
