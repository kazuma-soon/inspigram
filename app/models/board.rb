class Board < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_image, ProfileImageUploader

  validates :board_image, presence: ture
end
