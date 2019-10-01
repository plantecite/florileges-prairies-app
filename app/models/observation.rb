class Observation < ActiveRecord::Base

  belongs_to :releve

  belongs_to :taxon

end
