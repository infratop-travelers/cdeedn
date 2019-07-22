class Order < ApplicationRecord
    enum delivery_status: [ :undispatched, :sent, :delivered ]

    has_many :order_items
    belongs_to :customer
end
