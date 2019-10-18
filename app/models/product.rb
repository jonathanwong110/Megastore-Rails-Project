class Product < ApplicationRecord
    belongs_to :store
    belongs_to :cart

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :category, presence: true
end
