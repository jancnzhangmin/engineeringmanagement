class Question < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :questionstatu
  has_many :questionpris
  has_many :examines
  has_many :questiondescs
  has_many :childrens, class_name: "Question", foreign_key: "up_id"
  belongs_to :parent, class_name: "Question", foreign_key: "up_id", optional: true
end
