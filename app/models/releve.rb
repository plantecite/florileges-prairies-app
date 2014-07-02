class Releve < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :gestion

  has_many :observations
  accepts_nested_attributes_for :observations, :reject_if => :all_blank, :allow_destroy => true
end
