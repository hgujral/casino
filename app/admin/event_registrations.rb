ActiveAdmin.register EventRegistration do
  menu false
  
  show do
    panel "Event Registration" do
      attributes_table_for event_registration,
      :event_name,
      :event_type,
      :start_date,
      :end_date,
      :tickets_booked,
      :tickets_available,
      :pre_auth,
      :played,
      :status,
      :no_show,
      :code,
      :block,
      :center,
      :authorizer,
      :entered_by
    end
  end
  
end
