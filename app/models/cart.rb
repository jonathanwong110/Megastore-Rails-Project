class Cart < ApplicationRecord
    has_many :products, through: :users
    belongs_to :user
    has_many: cart_products

    def add_product(product_id)
        product = product.where('product_id = ?', product_id).first
        if product
            product.quantity + 1
            save
        end
    end
end
