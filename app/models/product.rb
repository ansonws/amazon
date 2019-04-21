class Product < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    before_validation :set_default_price

    validates(
        :title,
        presence: true,
        uniqueness: { case_sensitive: false }
    )

    validates(
        :description,
        presence: true,
        length: { minimum: 8 }
    )

    validates :price, numericality: { greater_than: 0 }

    before_validation :set_default_price
    before_validation :capitalize_title

    scope(:search, ->(query) { where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%" )})

    private

    def set_default_price
        self.price ||= 1
    end

    def capitalize_title
        self.title.capitalize!
    end

end
