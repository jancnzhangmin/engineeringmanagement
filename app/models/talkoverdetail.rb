class Talkoverdetail < ApplicationRecord
  belongs_to :talkover
  has_many :childrens, class_name: "Talkoverdetail", foreign_key: "up_id"
  belongs_to :parent, class_name: "Talkoverdetail", foreign_key: "up_id", optional: true
end
