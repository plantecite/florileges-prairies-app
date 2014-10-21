class Wood < ActiveRecord::Base
  belongs_to :releve

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
