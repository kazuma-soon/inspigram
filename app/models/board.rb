class Board < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy

  mount_uploader :board_image, BoardImageUploader

  validates :board_image, presence: true
  validates :board_image, file_size: { less_than: 20.megabytes }
end
