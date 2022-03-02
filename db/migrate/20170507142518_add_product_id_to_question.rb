class AddProductIdToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :product_id, :float
  end
end
