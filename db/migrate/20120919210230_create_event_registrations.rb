class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.string :event_name
      t.string :event_type
      t.datetime :start_date
      t.datetime :end_date
      t.integer :tickets_booked
      t.integer :tickets_available
      t.boolean :pre_auth
      t.boolean :played
      t.string :status
      t.boolean :no_show
      t.string :code
      t.string :block
      t.string :center
      t.string :authorizer
      t.string :entered_by
      t.integer :patron_id

      t.timestamps
    end
  end
end
