class Product < ApplicationRecord
    has_many :cart_products
    belongs_to :user
    has_many :reviews

    validates_presence_of :title, :price, :description, :image, :category

    def self.reviewed
        self.joins("INNER JOIN reviews ON reviews.product_id = products.id")
    end

end
