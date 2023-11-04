class Concert < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :reservations
end
