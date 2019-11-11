class CarsPart < ApplicationRecord
  belongs_to :car
  belongs_to :model

  validates car, presence: true
  validates part, presence: true

end
