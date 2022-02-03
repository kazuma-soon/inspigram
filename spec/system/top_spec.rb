require 'rails_helper'

RSpec.describe 'Top', type: :system do
  describe 'ログイン前' do
    before do
      visit root_path
    end

    it 'ルートパスにアクセスするとトップページが表示される' do
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

    it '画像投稿画面(boards/new)にアクセスすると、ルートパスに弾かれる' do
      visit new_board_path
      expect(current_path).to eq root_path
    end

    it '自分の投稿画像一覧(boards/mine)にアクセスすると、ルートパスに弾かれる' do
      visit mine_boards_path
      expect(current_path).to eq root_path
    end

    it 'ライク一覧画面(users/likes)にアクセスすると、ルートパスに弾かれる' do
      visit likes_users_path
      expect(current_path).to eq root_path
    end

    it 'トップページにはGoogleログインボタンがある' do
      expect(page).to have_selector('.top-authentication__sign-in-btn')
    end

    it 'navbar - Googleログインボタンを押すと、パスが切り替わる' do
      click_link("Start with Google")
      sleep 1
      expect(current_path).to eq boards_path
      expect(page).to have_content('ログインしました！')
    end

    it 'トップページにはアプリタイトルが表示されている' do
      expect(page).to have_selector('.top-title')
    end
  end

  describe 'ログイン後' do
    it 'ルートパスにアクセスするとトップページが表示される'
    it 'navbar - ロゴをクリックすると、トップページが表示される'
  end
end