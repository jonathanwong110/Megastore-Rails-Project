class User < ApplicationRecord
    has_secure_password
    has_one :cart
    has_many :user_products
    has_many :products, through: :user_products
    has_many :user_reviews
    has_many :reviews, through: :user_reviews

    validates_presence_of :username, :email, :password

    validates :username, uniqueness: { case_sensitive: false }

end
