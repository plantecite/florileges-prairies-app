class Observation < ActiveRecord::Base
  has_one :espece
  belongs_to :releve
end
