class Espece < ActiveRecord::Base

	mount_uploader :avatar, ImageUploader

	belongs_to :observation

end
