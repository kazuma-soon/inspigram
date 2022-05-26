class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :reactions, dependent: :destroy

  # statusがlikeのreactionレコードを取得
  has_many :like_reactions, -> { likes }, class_name: 'Reaction'
  # そのボードを取得
  has_many :like_boards, through: :like_reactions, source: :board

  enum role: { general: 0, admin: 1 }

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
      # findできなかったらブロック実行
      # update は create / update を切り替えてくれる
      find_or_create_by(email: user_params[:email]) do |user|
        user.update(user_params)
      end
    end

    private

    def user_params_from_auth_hash(auth_hash)
      {
        name: auth_hash.info.name,
        email: auth_hash.info.email,
        image: auth_hash.info.image
      }
    end
  end
end
