class AddProductReferencesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :product, index: true
  end
end
