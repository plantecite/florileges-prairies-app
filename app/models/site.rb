class Site < ActiveRecord::Base

	has_many :ownerships  
  has_many :users, :through => :ownerships

  has_many :gestions
  has_many :releves

  accepts_nested_attributes_for :ownerships

	# geocoded_by :location
	# after_validation :geocode

	mount_uploader :photo, ImageUploader
	mount_uploader :plan, ImageUploader

	reverse_geocoded_by :latitude, :longitude, :address => :location
	after_validation :reverse_geocode  # auto-fetch address


end
