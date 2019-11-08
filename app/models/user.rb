class User < ApplicationRecord
    has_secure_password
    has_one :cart
    has_many :user_products
    has_many :products, through: :user_products
    has_many :reviews

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true
    validates :password, presence: true
end
