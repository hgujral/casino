http://localhost:3000/customers/wsdl



class CustomersController < ApplicationController
  include WashOut::SOAP
  
  soap_action "index",
              :args   => nil,
              :return => {:customers => {:customer => 
                [{
                  :name => :string,
                  :address => :string,
                  :email => :string,
                  :updated_at => :date
                  }]
                }}
  def index
    customers = Customer.all.to_a
    render :soap => {:customers => {:customer => customers}}
  end
  
  soap_action "show",
              :args   => {:id => :string},
              :return => {:customer => {
                :nameon => :string,
                :address => :string,
                :email => :string,
                :reservations => { :reservation => 
                  [{
                    :start_date => :date,
                    :end_date => :date,
                    :active => :boolean
                    }]
                  }}}
  def show
    customer = Customer.includes(:reservations).find(params[:id])
    render :soap => {:customer => customer.attributes.merge({:reservations => {:reservation => customer.reservations}})}
  end
  
end

