class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :board

  enum status: { like: 0, dislike: 1 }

  scope :likes, -> { where(status: 'like').order(updated_at: :desc) }
end
