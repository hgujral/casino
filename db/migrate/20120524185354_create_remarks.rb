class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.text :description
      t.datetime :expired_at
      t.integer :agent_id
      t.integer :patron_id
      t.string :visible_to

      t.timestamps
    end
  end
end
