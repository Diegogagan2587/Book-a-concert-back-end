class User < ApplicationRecord
  has_many :reservations
  has_many :concerts, foreign_key: :organizer_id
end
