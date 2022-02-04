require 'rails_helper'

RSpec.describe 'Top', type: :system do
  before { ensure_browser_size }

  describe 'ログイン前' do
    before do
      visit root_path
    end

    it 'URL: ルートパスにアクセスするとトップページが表示される' do
      expect(current_path).to eq root_path
    end

    it 'navbar - ロゴをクリックすると、トップページが表示される' do
      click_link 'Inspigram'
      expect(current_path).to eq root_path
    end

    it 'navbar - スワイプページ(boards/index)にアクセスすると、ルートパスに弾かれる' do
      visit boards_path
      expect(current_path).to eq root_path
    end

    it 'URL: 画像投稿画面(boards/new)にアクセスすると、ルートパスに弾かれる' do
      visit new_board_path
      expect(current_path).to eq root_path
    end

    it 'URL: 自分の投稿画像一覧(boards/mine)にアクセスすると、ルートパスに弾かれる' do
      visit mine_boards_path
      expect(current_path).to eq root_path
    end

    it 'URL: ライク一覧画面(users/likes)にアクセスすると、ルートパスに弾かれる' do
      visit likes_users_path
      expect(current_path).to eq root_path
    end

    it 'トップページにはGoogleログインボタンがある' do
      expect(page).to have_selector('.top-authentication__sign-in-btn')
    end

    it 'navbar - Googleログインボタン押下で成功し、フラッシュメッセージ表示' do
      login('user')
      expect(current_path).to eq boards_path
      expect(page).to have_content('ログインしました！')
    end

    it 'トップページにはアプリタイトルが表示されている' do
      expect(page).to have_selector('.top-title')
    end
  end

  describe 'ログイン後' do
    before do
      login('user')
    end

    it 'Googleログインのボタンが表示されていない' do
      expect(page).not_to have_selector('.top-authentication__sign-in-btn')
    end

    it 'URL: (/) アクセス成功' do
      visit root_path
      expect(current_path).to eq root_path
    end

    it 'URL: (boards/index) アクセス成功' do
      visit boards_path
      expect(current_path).to eq boards_path
    end

    it 'URL: (boards/new) アクセス成功' do
      visit new_board_path
      expect(current_path).to eq new_board_path
    end

    it 'URL: (boards/mine) アクセス成功' do
      visit mine_boards_path
      expect(current_path).to eq mine_boards_path
    end

    it 'URL: (users/likes) アクセス成功' do
      visit likes_users_path
      expect(current_path).to eq likes_users_path
    end

    it 'navbar - ロゴをクリックすると、トップページが表示される' do
      find('.app-title').click
      expect(current_path).to eq root_path
    end

    it 'navbar - スワイプページ(boards/index)にアクセス成功' do
      click_link 'Collection'
      expect(current_path).to eq boards_path
    end

    it 'navbar - 画像投稿画面(boards/new)にアクセス成功' do
      click_link 'Create'
      expect(current_path).to eq new_board_path
    end

    it 'navbar - 自分の投稿画像一覧(boards/mine)にアクセス成功' do
      click_link 'My collection'
      expect(current_path).to eq mine_boards_path
    end

    it 'navbar - ライク一覧画面(users/likes)にアクセス成功' do
      click_link 'Favorite'
      expect(current_path).to eq likes_users_path
    end

    it 'navbar - ログアウトをクリックでフラッシュが表示される' do
      click_link 'Logout'
      sleep 1
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウトしました！')
    end
  end
end
