class Board < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy

  mount_uploader :board_image, BoardImageUploader

  validates :board_image, presence: true
end