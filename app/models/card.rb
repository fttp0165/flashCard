class Card < ApplicationRecord
      #驗證缺少資料則不會寫入
      #validates :name, presence: true
      validates :title, presence: true
      validates :content, presence: true
      has_many :comments
end
