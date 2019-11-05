class Order < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :orderdetails
end
