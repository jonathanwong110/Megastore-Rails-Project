class Product < ApplicationRecord
    has_many :cart_products
    has_many :reviews
    belongs_to :user

    validates_presence_of :title, :price, :description, :category

    def self.reviewed
        self.joins("INNER JOIN reviews ON reviews.product_id = products.id")
    end

end
