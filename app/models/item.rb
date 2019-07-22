class Item < ApplicationRecord
    enum delivery_status: [ :undispatched, :sent, :delivered ]

    attachment :image

    has_many :favorites
    has_many :discs
    has_many :cart_item
    has_many :order_item
    belongs_to :singer
    belongs_to :label
    belongs_to :genre

    validates :singer_id, presence: true
    validates :genre_id, presence: true
    validates :label_id, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :name, presence: true
    validates :image_id, presence: true
    validates :delivery_status, presence: true
end
