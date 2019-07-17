class Item < ApplicationRecord
    has_many :favorites
    has_many :discs
    belongs_to :cart_item
    belongs_to :order_item
    belongs_to :singer
    belongs_to :label
    belongs_to :genre
end
