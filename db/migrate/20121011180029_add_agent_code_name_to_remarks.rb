class AddAgentCodeNameToRemarks < ActiveRecord::Migration
  def change
    add_column :remarks, :entered_by_code, :string

    add_column :remarks, :entered_by_name, :string

    add_column :remarks, :entered_at, :datetime
  end
end
