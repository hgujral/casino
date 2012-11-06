class CreatePointBalances < ActiveRecord::Migration
  def change
    create_table :point_balances do |t|
      t.integer :corporate_id
      t.datetime :balance_at
      t.string :revenue_center
      t.string :description
      t.decimal :amount
      t.decimal :balance
      t.integer :comp_number
      t.string :entered_by
      t.string :authorized_by
      t.references :patron

      t.timestamps
    end
    add_index :point_balances, :patron_id
  end
end
