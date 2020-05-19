class Kitten < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 20 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 
  validates :cuteness, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :softness, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
