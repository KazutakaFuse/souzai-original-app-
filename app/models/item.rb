class Item < ApplicationRecord
  has_many :reviews
  
  #validates :code, presence: true,length: { maximum: 255 }
  #validates :name, presence: true, length: { maximum: 15 }
  #validates :url, presence: true,　length: { maximum: 255 }
  #validates :image_url, presence: true,　length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :image_url, presence: true
end