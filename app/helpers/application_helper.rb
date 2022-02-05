module ApplicationHelper
  def liked_count_of(board)
    board.reactions.where(status: 'like').count
  end

  def page_title(page_title = '')
    base_title = 'Inspigram'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
