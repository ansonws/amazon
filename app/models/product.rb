class Product < ApplicationRecord
    belongs_to :user
    before_validation :set_default_price
    before_save :capitalize_title 
    
    validates(
        :title, 
        presence: true, 
        uniqueness: { case_sensitive: false }
    )

    validates(
        :price, 
        numericality: { greater_than: 0 }
    ) 
    
    validates(
        :description,
        presence: true,
        length: { minimum: 10 }
    )

    def search
        Products.all
    end

    private

    def capitalize_title
        self.title.capitalize!
    end

    def set_default_price
        self.price ||= 1.00
    end

end
