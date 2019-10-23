class User < ApplicationRecord
    has_secure_password
    has_one :cart
    has_many :products, through: :cart
    has_many :reviews, through: :products

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true
    validates :password, presence: true
    validates :store, inclusion: { in: [ true, false ] }
end
