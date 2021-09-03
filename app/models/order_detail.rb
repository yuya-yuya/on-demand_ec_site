class OrderDetail < ApplicationRecord
    enum makeing_status: { impossible: 0, waiting: 1, progress: 2, complete: 3 }
    
    belongs_to :order
    belongs_to :item
end
