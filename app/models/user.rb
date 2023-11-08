class User < ApplicationRecord
  has_many :reservations
  has_many :concerts, foreign_key: :organizer_id

  validates :name, presence: true, uniqueness: true
end
