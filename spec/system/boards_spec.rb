require 'rails_helper'

RSpec.describe 'Boards', type: :system do
  before do
    login('user')
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
      click_button('Create')
      expect(page).to have_content('画像を入力してください')
    end

    it '画像投稿に成功すると、フラッシュ表示・投稿一覧ページへ遷移する' do
      # locator = name要素でパスできる
      image_upload
      expect(current_path).to eq mine_boards_path
      expect(page).to have_content('画像を投稿しました！')
    end
  end

  describe '投稿画像一覧ページ / My collection' do
    it '自分の投稿した画像・アイコンが表示される' do
      image_upload
      expect(page).to have_selector('.my-board-box')
      expect(page).to have_selector('.my-icon-star')
      expect(page).to have_selector('.my-icon-trash')
    end

    it '投稿を削除できる' do
      image_upload
      page.accept_confirm do
        find('.my-icon-trash').click
      end
      expect(page).not_to have_selector('.my-board-box')
    end
  end

  describe 'ライク一覧ページ / Faborite' do
    before do
      # 画像を投稿しておく
      image_upload
      logout

      # 別ユーザーでログインしてライク挙動を見る
      login('other_user')
    end

    it 'いいねアイコンを押すと、Favoriteに表示される' do
      image_like

      visit likes_users_path
      expect(page).to have_selector('.board-box')
    end

    it 'いいねアイコンを押すと、スターアイコンの数字が１増える' do
      image_like

      visit likes_users_path
      expect(page).to have_selector('.icon-star')
      expect(page).to have_content('1')
    end

    it 'いいねアイコンを押されると、投稿者のMy collectionにてスターアイコンの数が１増える' do
      image_like
      logout

      login('user')
      visit mine_boards_path
      expect(page).to have_content('1')
    end

    it 'よくないアイコンを押すと、My collecyionには表示されない' do
      image_dislike

      visit likes_users_path
      expect(page).not_to have_selector('.board-box')
      expect(page).not_to have_selector('.icon-star')
    end

    it 'いいねしたものをよくないすると、My collectionから削除される' do
      image_like
      visit likes_users_path
      expect(page).to have_selector('.board-box')

      image_dislike
      visit likes_users_path
      expect(page).not_to have_selector('.board-box')
    end

    it 'いいねしたものをよくないされると、スターアイコンが１減る' do
      image_like
      visit current_path # リロード
      image_dislike
      logout

      login('user')
      visit mine_boards_path
      expect(page).to have_content('0')
    end
  end
end
