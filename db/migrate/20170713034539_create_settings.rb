class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.belongs_to :shop, index: { unique: true }
      t.string :user_message
      t.string :notification_message
      t.string :shop_domain

      t.timestamps
    end
  end
end
