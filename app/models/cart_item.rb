class CartItem < ApplicationRecord
    has_one :item
    belongs_to :customer
end
