class OrderItem < ApplicationRecord

    has_one :item
    belongs_to :order
end
