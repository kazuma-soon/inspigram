class ReactionsController < ApplicationController
  def create
    # updateメソッドはcreate, updateを自動で判断してくれる
    reaction = Reaction.find_or_initialize_by(board_id: params[:board_id], user_id: current_user.id)
    reaction.update(
      status: params[:reaction]
    )
  end
end
