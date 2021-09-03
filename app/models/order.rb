class Order < ApplicationRecord
    enum status: { waiting: 0, confirm: 1, making: 2, preparing: 3, sent:4 }
    enum payment_method: { card: 0, bank: 1 }
    # f.collectionなどの一部のメソッドが日本語だと使えなくなるので、英語で登録。
    
    belongs_to :customer
    has_many :order_details
end
