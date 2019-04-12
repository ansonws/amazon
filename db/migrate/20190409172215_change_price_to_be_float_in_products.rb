class ChangePriceToBeFloatInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :float 
  end
  def change
    change_column :products, :price, :integer
  end
end
