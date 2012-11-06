class CreateTierLevels < ActiveRecord::Migration
  def change
    create_table :tier_levels do |t|
      t.datetime :start_on
      t.datetime :end_on
      t.string :name
      t.decimal :current_tier_balance
      t.references :patron

      t.timestamps
    end
    add_index :tier_levels, :patron_id

  end
end
