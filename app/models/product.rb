class Product < ApplicationRecord
    belongs_to :customer
    belongs_to :cart

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :category, presence: true
end
