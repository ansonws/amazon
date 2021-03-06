class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates(
        :rating,
        numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    )
    validates(
        :body,
        length: { minimum: 8 }
    )

end
