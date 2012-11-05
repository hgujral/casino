ActiveAdmin.register NonGamingComp do
  menu false
  
  show do
    panel "Non Gaming Comp" do
      attributes_table_for non_gaming_comp,
      :reservation_at,
      :revenue_center,
      :status,
      :amount,
      :comp_number,
      :discretionary,
      :played,
      :no_of_people,
      :reason,
      :meal_type,
      :approved_by,
      :entered_by,
      :comments
    end
  end
  
end
