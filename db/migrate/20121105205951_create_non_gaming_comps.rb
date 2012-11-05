class CreateNonGamingComps < ActiveRecord::Migration
  def change
    create_table :non_gaming_comps do |t|
      t.datetime :reservation_at
      t.string :revenue_center
      t.string :status
      t.decimal :amount
      t.integer :comp_number
      t.boolean :discretionary
      t.boolean :played
      t.integer :no_of_people
      t.string :reason
      t.string :meal_type
      t.string :approved_by
      t.string :entered_by
      t.string :comments
      t.integer :patron_id

      t.timestamps
    end
  end
end
