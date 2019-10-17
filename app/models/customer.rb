class Customer < ApplicationRecord
    has_many :products, through: :carts
end
