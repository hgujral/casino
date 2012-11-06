ActiveAdmin.register PointBalance do
  menu false
  
  show do
    panel "Point Balance" do
      attributes_table_for point_balance,
      :corporate_id,
      :balance_at,
      :revenue_center,
      :description,
      :amount,
      :balance,
      :comp_number,
      :entered_by,
      :authorized_by
    end
  end
end
