class BoardsController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  def index
    @boards = Board.where.not(user_id: current_user.id).order(created_at: :desc)
  end

  def mine
    @boards = current_user.boards.all.order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: '画像を投稿しました！'
    else
      render :new
      flash.now[:danger] = '画像の投稿に失敗しました！'
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to mine_boards_path, success: '画像を削除しました！'
  end

  private

  def board_params
    params.require(:board).permit(:board_image, :board_image_cache)
  end
end
