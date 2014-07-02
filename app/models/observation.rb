class Observation < ActiveRecord::Base
  has_one :espece
  belongs_to :releve
  
  accepts_nested_attributes_for :espece
end
