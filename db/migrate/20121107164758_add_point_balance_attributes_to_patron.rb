class AddPointBalanceAttributesToPatron < ActiveRecord::Migration
  def change
    add_column :patrons, :pre_auth_comp_cash, :decimal

    add_column :patrons, :available_comp_cash, :decimal

  end
end
