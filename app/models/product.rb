class Product < ApplicationRecord
    belongs_to :user
    belongs_to :cart, optional: true
    has_many: cart_products

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :category, presence: true

end
