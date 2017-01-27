class AddPaymentStuffToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :payment_provider, :string
    add_column :users, :payment_id, :string
    add_column :users, :subscription_id, :string
  end
end
