class Address < ApplicationRecord
    belongs_to :customer

    validates :post_code, presence: true
    validates :prefecture, presence: true
    validates :city, presence: true
    validates :street, presence: true
end
