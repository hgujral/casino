class AcscController < ApplicationController
  include WashOut::SOAP

  soap_action "queryPlayerInfo",
              :args   => nil,
              :return => {:playerResultList => {:patron => 
                [{
                  :card_number => :string,
                  :first_name => :string,
                  :last_name => :string,
                  :dob => :date,
		  :city => :string,
		  :state => :string,
		  :phone => :string
                  }]
                }},
	      :to => :index 
  def index
    patrons = Patron.all.to_a
    render :soap => {:playerResultList => {:patron => patrons}}
  end
  
end
