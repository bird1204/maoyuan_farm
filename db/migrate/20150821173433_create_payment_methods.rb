class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
