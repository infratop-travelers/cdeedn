class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer

    validates :customer_id, presence: true
    validates :item_id, presence: true
    validates :count, presence: true
end