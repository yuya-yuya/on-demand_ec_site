class Item < ApplicationRecord
    enum is_active: { 販売中: 0, 販売停止: 1 }
    
    belongs_to :genre
    has_many :cart_items
    has_many :order_details
    
    attachment :image
    # image_magic忘れずに！！
    validates :name,  presence: true
    validates :introduction,  presence: true
    validates :price,  presence: true
    validates :is_active,  presence: true
    validates :genre_id,  presence: true
    
end
