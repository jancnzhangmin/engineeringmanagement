class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :project

  private
  def pinyin
    self.fullpinyin = Pinyin.t(self.contact, splitter: '')
    self.pinyin = Pinyin.t(self.contact) { |letters| letters[0] }
    self.save
  end
end
