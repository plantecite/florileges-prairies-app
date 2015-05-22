class Espece < ActiveRecord::Base

	mount_uploader :avatar, ImageUploader

end
