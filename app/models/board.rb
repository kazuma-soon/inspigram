class Board < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy

  mount_uploader :board_image, BoardImageUploader

  validates :board_image, presence: true

  scope :popular_boards, -> { find(Reaction.where(status: 'like').group(:board_id).order('count(board_id) desc').limit(6).pluck(:board_id)) }
end