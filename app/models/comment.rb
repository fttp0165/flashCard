class Comment < ApplicationRecord
  belongs_to :card
  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)    
  end
end
