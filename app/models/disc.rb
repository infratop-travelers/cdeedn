class Disc < ApplicationRecord
    belongs_to :item
    has_many :songs, dependent: :destroy

    validates :name, presence: true
    validates :item_id, presence: true
end
