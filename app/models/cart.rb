class Cart < ApplicationRecord
    has_many :products, through: :users
end
