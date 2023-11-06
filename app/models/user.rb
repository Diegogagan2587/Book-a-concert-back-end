class User < ApplicationRecord
  has_many :reservations
  has_many :concerts
end
