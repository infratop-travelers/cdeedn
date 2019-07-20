class Item < ApplicationRecord
    enum delivery_status: [ :undispatched, :sent, :delivered ]

    has_many :favorites
    has_many :discs
    has_many :cart_item
    has_many :order_item
    belongs_to :singer
    belongs_to :label
    belongs_to :genre
end
