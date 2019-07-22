class Song < ApplicationRecord
    belongs_to :disc

    validates :name, presence: true
    validates :disc_id, presence: true
    validates :number, presence: true
end
