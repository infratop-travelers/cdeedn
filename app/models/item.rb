class Item < ApplicationRecord
    enum delivery_status: [['未発送', 0], ['発送済み', 1],['配達済み', 2]]

    has_many :favorites
    has_many :discs
    has_many :cart_item
    has_many :order_item
    belongs_to :singer
    belongs_to :label
    belongs_to :genre
end
