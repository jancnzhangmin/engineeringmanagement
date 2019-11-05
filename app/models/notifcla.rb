class Notifcla < ApplicationRecord
  has_many :notifs
  has_many :users, through: :notifs
end
