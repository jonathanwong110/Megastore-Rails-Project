class Review < ApplicationRecord
    belongs_to :user
    belongs_to :product
    has_many :user_reviews

    validates :content, presence: true

end
