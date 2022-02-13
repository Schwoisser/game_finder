class Language < ApplicationRecord

  has_and_belongs_to_many :users
  
  has_one_attached :flag_image, :dependent => :destroy

end
