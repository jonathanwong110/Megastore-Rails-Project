class Product < ApplicationRecord
    has_many :cart_products
    has_many :reviews
    belongs_to :user

    validates_presence_of :title, :price, :description, :category

end
