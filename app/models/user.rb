class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :react_boards, through: :reactions, source: :board

  def favorite_boards
    reactions.where(status: 'like').order(created_at: :desc)
  end

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
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
