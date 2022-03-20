class AbuseReport < ApplicationRecord

  belongs_to :match

  belongs_to :user
  belongs_to :reported_user, class_name: "User"


end