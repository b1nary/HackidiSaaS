class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.string :stripe_id
      t.float :price
      t.string :bootstrap
      t.boolean :public

      t.timestamps
    end
  end
end
