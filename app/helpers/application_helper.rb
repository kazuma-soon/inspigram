module ApplicationHelper
  def liked_count_of(board)
    board.reactions.where(status: 'like').count
  end
end
