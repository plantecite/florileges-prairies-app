class Ownership < ActiveRecord::Base
	belongs_to :user
	belongs_to :site

	accepts_nested_attributes_for :user
end
