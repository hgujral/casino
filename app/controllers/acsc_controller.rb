class AcscController < ApplicationController
  include WashOut::SOAP

  soap_action "queryPlayerInfo",
              :args   => {
                :card_number => :string,
                :searchHostsPatronsOnly => :boolean,
                :card_number => :string,
                :first_name => :string,
                :last_name => :string,
                :phone => :string
              },
              :return => {:playerResultList => 
                {:patron => 
                  [{
                    :card_number => :string,
                    :first_name => :string,
                    :last_name => :string,
                    :dob => :dateTime,
                    :home_city => :string,
                    :home_state => :string,
                    :home_phone => :string,
                    :agent_id => :integer
                  }]
                }
              },
	      :to => :queryPlayerInfo 
  def queryPlayerInfo
    if params[:searchHostsPatronsOnly]
      patrons = Patron.where(:agent_id => params[:agent_id])
    else
      patrons = Patron.all
    end
    render :soap => {:playerResultList => {:patron => patrons}}
  end
  
    soap_action "fetchPlayerInfo",
              :args   => {
                :card_number => :string
              },
              :return => {:patron_detail => 
                {
                  :card_number => :string,
                  :first_name => :string,
                  :last_name => :string,
                  :email => :string,
                  :dob => :dateTime,
                  :gender => :string,
                  :aka => :string,
                  :passport_number => :string,
                  :ethnicity => :string,
                  :ssn => :string,
                  :mail_code => :string,
                  :home_phone => :string,
                  :cell_phone => :string,
                  :other_phone => :string,
                  :dl_state => :string,
                  :dl_number => :string,
                  :dl_expires_at => :dateTime,
                  :home_address => :string,
                  :home_city => :string,
                  :home_state => :string,
                  :home_zip => :string,
                  :home_country => :string,
                  :business_name => :string,
                  :business_address => :string,
                  :business_city => :string,
                  :business_state => :string,
                  :business_zip => :string,
                  :busines_country => :string,
                  :tier_level => :string,
                  :tier_balance => :integer,
                  :points_to_next_tier => :integer,
                  :acsc_code_status => :string,
                  :adt => :integer,
                  :representative => :string,
                  :point_balance => :integer,
                  :agent_id => :integer
                }
              },
	      :to => :fetchPlayerInfo 
  def fetchPlayerInfo
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:patron_detail => patron}
  end
  
  soap_action "queryPlayerRemarks",
              :args   => {
                :card_number => :string
              },
              :return => {:playerRemarksResultList => 
                {:remark => 
                  [{
                    :description => :string,
                    :expired_at => :dateTime,
                    :visible_to => :string,
                    :agent_id => :integer
                  }]
                }
              },
	      :to => :queryPlayerRemarks 
  def queryPlayerRemarks
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:playerRemarksResultList => {:remark => patron.remarks}}
  end
end
