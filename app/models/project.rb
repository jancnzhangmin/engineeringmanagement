class Project < ApplicationRecord
  has_many :notices
  has_many :documents
  has_many :contacts
  has_many :orders
  has_many :talkovers
  has_many :projectauths
  has_many :users
  has_many :questions
end
