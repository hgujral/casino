ActiveAdmin.register Patron do
  
  index do
    column "Card Number"  do |patron|
      link_to patron.card_number, admin_patron_path(patron)
    end
    column :first_name
    column :last_name
    column :dob
    column :home_city
    column :home_state
    column :home_phone
  end
  
end
