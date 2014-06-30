class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :ownerships  
  has_many :sites, :through => :ownerships

  mount_uploader :avatar, ImageUploader

  after_create :assign_default_role

  def assign_default_role
    add_role(:user)
  end

end
