class Questiondesc < ApplicationRecord
  belongs_to :question
  has_many :questiondescimgs
  belongs_to :user
end
