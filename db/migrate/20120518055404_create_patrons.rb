class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :card_number
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
