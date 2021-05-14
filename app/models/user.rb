class User < ApplicationRecord
  acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :games

  def full_name
    "#{first_name} #{last_name}" 
  end
end
