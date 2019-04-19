class Product < ApplicationRecord
    before_validation :set_default_price

    validates(
        :title,
        presence: true,
        uniqueness: { case_sensitive: false }
    )

    validates{
        :desctipion,
        presence: true,
        length: { minimum: 8 }
    }

    validates :price, numericality: { greater_than: 0 }

    validate :search

    before_validation :set_default_price
    before_validation :capitalize_title

    private

    scope(:search -> query { where("title ILIKE ?", "%#{query}%") }

    end

    def set_default_price
        self.price ||= 1
    end

    def capitalize_title
        self.title.capitalize!
    end

end
