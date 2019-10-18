class Customer < ApplicationRecord
    has_secure_password

    has_many :products, through: :carts

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true
    validates :password, presence: true
end
