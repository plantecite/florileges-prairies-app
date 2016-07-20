class Releve < ActiveRecord::Base
  belongs_to :user
  belongs_to :site

  has_many :observations

  accepts_nested_attributes_for :observations, :reject_if => :all_blank, :allow_destroy => true

  has_many :woods
  accepts_nested_attributes_for :woods, :reject_if => :all_blank

  validates_presence_of :date


end
