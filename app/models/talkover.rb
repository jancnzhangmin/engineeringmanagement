class Talkover < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :talkoverdetails
end
