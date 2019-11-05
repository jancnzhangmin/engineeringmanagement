class User < ApplicationRecord
  has_many :admingroups
  has_many :notifs
  has_many :notifclas, through: :notifs
  has_many :notices
  has_many :documents
  has_many :contacts
  has_many :orders
  has_many :talkovers
  belongs_to :project, optional: true
  has_many :questions
  has_many :questiondescs
  has_secure_password
end
