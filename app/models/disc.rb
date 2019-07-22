class Disc < ApplicationRecord
    belongs_to :item
    has_many :songs

    validates :name, presence: true
    validates :item_id, presence: true
end
