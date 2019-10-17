class Cart < ApplicationRecord
    has_many :products
    has_many :customers, through: :products
end
