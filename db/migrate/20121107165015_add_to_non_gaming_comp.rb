class AddToNonGamingComp < ActiveRecord::Migration
  def change
      add_column :non_gaming_comps, :non_gaming_flag, :boolean
      add_column :non_gaming_comps, :function, :string

  end
end
