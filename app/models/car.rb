class Car < ApplicationRecord
  belongs_to :make
  has_and_belongs_to_many :parts

  #Validations
  validates :make_id, presence: true
  validates :model, presence: true
  validates :country, presence: true
  validates :VIN, numericality: { greater_than_or_equal_to: 1 }

end
