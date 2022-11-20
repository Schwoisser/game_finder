class DevNote < ApplicationRecord
  belongs_to :user
  has_one_attached :image, :dependent => :destroy
  # has_rich_text :text
end