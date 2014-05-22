class Site < ActiveRecord::Base

	has_many :ownerships  
  has_many :users, :through => :ownerships

  has_many :gestions

	# geocoded_by :location
	# after_validation :geocode

	mount_uploader :photo, ImageUploader
	mount_uploader :plan, ImageUploader

end
