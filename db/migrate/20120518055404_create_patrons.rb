class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :card_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :dob
      t.string :gender
      t.string :aka
      t.string :passport_number
      t.string :ethnicity
      t.string :ssn
      t.string :mail_code
      t.string :home_phone
      t.string :cell_phone
      t.string :other_phone
      t.string :dl_state
      t.string :dl_number
      t.datetime :dl_expires_at
      t.string :home_address
      t.string :home_city
      t.string :home_state
      t.string :home_zip
      t.string :home_country
      t.string :business_name
      t.string :business_address
      t.string :business_city
      t.string :business_state
      t.string :business_zip
      t.string :busines_country
      t.string :tier_level
      t.integer :tier_balance
      t.integer :points_to_next_tier
      t.string :acsc_code_status
      t.integer :adt
      t.string :representative
      t.integer :point_balance
      t.integer :agent_id

      t.timestamps
    end
  end
end
