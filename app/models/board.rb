class Board < ApplicationRecord
  belongs_to :user
  mount_uploader :board_image, BoardImageUploader

  validates :board_image, presence: true
end
