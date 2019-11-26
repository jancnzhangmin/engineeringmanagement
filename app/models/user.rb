class User < ApplicationRecord
  has_many :admingroups
  has_many :notifs
  has_many :notifclas, through: :notifs
  has_many :notices
  has_many :documents
  has_many :contacts
  has_many :orders
  has_many :talkovers
  has_many :questions
  has_many :questiondescs
  has_many :collaborates
  has_many :projects, through: :collaborates
  has_secure_password :validations => false

  after_create :create_token

  private
  def create_token
    self.token = Digest::SHA1.hexdigest self.id.to_s
    self.save
  end
end
