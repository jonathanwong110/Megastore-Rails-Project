class Product < ApplicationRecord
    has_many :cart_products
    has_many :reviews
    belongs_to :user

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :category, presence: true

end
