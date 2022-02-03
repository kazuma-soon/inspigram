require 'rails_helper'

RSpec.describe 'Boards', type: :system do
  before do
    login
    ensure_browser_size
  end

  describe 'スワイプページ / Collection' do
    it '自分の投稿画像は表示されない' do
      image_upload
      visit boards_path
      expect(page).not_to have_selector('.swipe--card')
    end

    it '他者の投稿画像は表示される' do
      image_upload
      logout

      login('other_user')
      visit boards_path
      expect(page).to have_selector('.swipe--card')
    end
  end

  describe '画像投稿ページ / Create' do
    before { visit new_board_path }

    it '未入力で投稿すると、エラー・フラッシュが表示される' do
      click_button('投稿する')
      expect(page).to have_content('画像を入力してください')
    end

    it '画像投稿に成功すると、投稿一覧ページへ遷移する' do
      # locator = name要素でパスできる
      image_upload
      expect(current_path).to eq mine_boards_path
      expect(page).to have_content('画像を投稿しました！')
    end
  end

  describe '投稿画像一覧ページ / My collection' do
    it '自分の投稿した画像が表示される' do
      image_upload
      expect(page).to have_selector('.my-board-box')
    end
  end

  describe 'ライク一覧ページ / Faborite'
end
