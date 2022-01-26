class BoardsController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path
      flash[:notice] = '画像を投稿しました'
    else
      render :new
      flash.now[:notice] = '画像の投稿に失敗しました'
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
  end
end

private

def board_params
  params.require(:board).permit(:board_image)
end
