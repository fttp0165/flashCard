class Card < ApplicationRecord
      #驗證缺少資料則不會寫入
      #validates :name, presence: true
      validates :title, presence: true
      validates :content, presence: true
      has_many :comments
      belongs_to :user
      has_many :favorite_cards
      has_many :users,through: :favorite_cards
end
