class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.text    :property
      t.string  :myshopify_domain
      
      t.timestamps
    end
  end
end
