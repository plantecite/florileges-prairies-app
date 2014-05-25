class Site < ActiveRecord::Base

	has_many :ownerships  
  has_many :users, :through => :ownerships

  has_many :gestions

	# geocoded_by :location
	# after_validation :geocode

	mount_uploader :photo, ImageUploader
	mount_uploader :plan, ImageUploader

	reverse_geocoded_by :latitude, :longitude, :address => :location
	after_validation :reverse_geocode  # auto-fetch address

	def set_user!(user)
  	self.users.id = user.id

  	self.save!
  end

end
