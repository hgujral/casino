ActiveAdmin.register TierLevel do
  menu false
  
  show do
    panel "Tier Level" do
      attributes_table_for tier_level,
      :start_on,
      :end_on,
      :name,
      :current_tier_balance
    end
  end
end
