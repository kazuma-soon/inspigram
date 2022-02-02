require 'rails_helper'

RSpec.describe Top, type: :system do
  describe 'ログイン前' do
    it 'ルートパスにアクセスするとトップページが表示される'
    it '画像投稿画面(boards/new)にアクセスすると、ルートパスに弾かれる'
    it 'ライク一覧画面(users/likes)にアクセスすると、ルートパスに弾かれる'
  end
end