module LikeDislikeSupport
  def image_like
    visit boards_path
    find('#like').click
    sleep 1
  end

  def image_dislike
    visit boards_path
    find('#dislike').click
    sleep 1
  end
end
