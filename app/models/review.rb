class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
