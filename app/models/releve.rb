class Releve < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :gestion
  has_one :observation
end
