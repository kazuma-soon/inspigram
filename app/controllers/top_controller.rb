class TopController < ApplicationController
  skip_before_action :check_logged_in, only: %i[index guest_index]

  def index
    # 人気ランキングの取得
    @boards = Board.popular_boards
  end

  # boards#guest_indexへ移行
  # def guest_index
  #   @all_boards = Board.all.order(created_at: :desc)
  # end
end
