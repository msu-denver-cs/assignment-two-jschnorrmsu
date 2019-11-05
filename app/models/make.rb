class Make < ApplicationRecord
  has_many :cars

  # Validations.
  validates :name, presence: true
  validates :country, presence: true
end
