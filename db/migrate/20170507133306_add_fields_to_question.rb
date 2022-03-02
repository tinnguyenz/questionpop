class AddFieldsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :customer_name, :string
    add_column :questions, :customer_email, :string
    add_column :questions, :customer_phone, :string
    add_column :questions, :question_content, :string
    add_column :questions, :shop_id, :integer
    add_column :questions, :shop_domain, :string
  end
end
