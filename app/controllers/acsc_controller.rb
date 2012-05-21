class AcscController < ApplicationController
  include WashOut::SOAP

  soap_action "queryPlayerInfo",
              :args   => {
                :agent_id => :integer,
                :searchHostsPatronsOnly => :boolean,
                :card_number => :string,
                :first_name => :string,
                :last_name => :string,
                :dob => :date,
                :phone => :string
              },
              :return => {:playerResultList => 
                {:patron => 
                  [{
                    :card_number => :string,
                    :first_name => :string,
                    :last_name => :string,
                    :dob => :date,
                    :city => :string,
                    :state => :string,
                    :phone => :string,
                    :agent_id => :integer
                  }]
                }
              },
	      :to => :index 
  def index
    if params[:searchHostsPatronsOnly]
      patrons = Patron.where(:agent_id => params[:agent_id])
    else
      patrons = Patron.all
    end
    render :soap => {:playerResultList => {:patron => patrons}}
  end
  
end
