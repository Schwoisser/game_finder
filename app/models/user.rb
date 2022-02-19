class User < ApplicationRecord
  include Turbo::Broadcastable
  
  acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :games
  has_and_belongs_to_many :languages
  has_many :armies
  has_many :battle_reports
  has_many :match_scorings, class_name: "MatchScoring"
  has_many :matches
  has_one_attached :image, :dependent => :destroy

  has_and_belongs_to_many :player_attributes

  def has_coordinates?
    longitude && latitude
  end
  
  def full_name
    "#{first_name} \"#{nick_name}\" #{last_name}" 
  end

  def friend_list
    FriendList.where("inviting_user_id = ? or receiving_user_id = ?", id, id).where(status: :accepted)
  end

  def friend_list_request
    FriendList.where(receiving_user_id: id, status: :sent)
  end
end
