class Releve < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :gestion

  has_many :observations
  accepts_nested_attributes_for :observations, :reject_if => :all_blank, :allow_destroy => true

  has_many :taxrefobservations
  accepts_nested_attributes_for :taxrefobservations, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :date
end
