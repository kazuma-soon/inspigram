module ImageUploadSupport
  def image_upload
    visit new_board_path
    attach_file('board[board_image]', 'spec/images/sample.jpg', make_visible: true)
    click_button('投稿する')
  end
end
