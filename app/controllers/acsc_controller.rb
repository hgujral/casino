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
                    :id => :integer,
                    :description => :string,
                    :entered_at => :dateTime,
                    :expired_at => :dateTime,
                    :entered_by_code => :string,
                    :entered_by_name => :string,
                    :visible_to => :string
                  }]
                }
              },
	      :to => :queryPlayerRemarks 
  def queryPlayerRemarks
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:playerRemarksResultList => {:remark => patron.remarks}}
  end
  
  soap_action "fetchPlayerRemark",
              :args   => {
                :player_remark_id => :integer
              },
              :return => 
                {:remark => 
                  {
                    :id => :integer,
                    :description => :string,
                    :entered_at => :dateTime,
                    :expired_at => :dateTime,
                    :entered_by_code => :string,
                    :entered_by_name => :string,
                    :visible_to => :string
                  }
                },
	      :to => :fetchPlayerRemark 
  def fetchPlayerRemark
    remark = Remark.find(params[:player_remark_id])
    render :soap => {:remark => remark}
  end
  
  soap_action "createPlayerRemarks",
              :args   => {
                :card_number => :string,
                :remark => 
                  {
                    :id => :integer,
                    :description => :string,
                    :entered_at => :dateTime,
                    :expired_at => :dateTime,
                    :entered_by_code => :string,
                    :entered_by_name => :string,
                    :visible_to => :string
                  }
              },
              :return => {
                :player_remark_id => :integer 
              },
              :to => :createPlayerRemarks 
  def createPlayerRemarks
    patron = Patron.find_by_card_number(params[:card_number])
    player_remark = Remark.new(params[:remark])
    player_remark.patron = patron
    player_remark.save
    render :soap => {:player_remark_id => player_remark.id}
  end
  
  soap_action "updatePlayerRemarks",
              :args   => {
                :player_remark_id => :integer,
                :remark => 
                  {
                    :id => :integer,
                    :description => :string,
                    :entered_at => :dateTime,
                    :expired_at => :dateTime,
                    :entered_by_code => :string,
                    :entered_by_name => :string,
                    :visible_to => :string
                  }
              },
              :return => {
                :player_remark_id => :integer 
              },
              :to => :updatePlayerRemarks 
  def updatePlayerRemarks
    player_remark = Remark.find(params[:player_remark_id])
    player_remark.update_attributes(params[:remark])
    render :soap => {:player_remark_id => player_remark.id}
  end
  
  soap_action "deletePlayerRemark",
            :args   => {
              :player_remark_id => :integer
            },
            :return => {:player_remark_id => :integer
            },
            :to => :deletePlayerRemark 
  def deletePlayerRemark
    Remark.find(params[:player_remark_id]).destroy
    render :soap => {:player_remark_id => params[:player_remark_id]}
  end
  
  soap_action "queryPlayerGamingTripSummary",
              :args   => {
                :card_number => :string
              },
              :return => {:playerGamingTripSummary => 
                {:gaming_trip_summary => 
                  [{
                    :id => :integer,
                    :played_at => :dateTime,
                    :average_bet => :integer,
                    :percent_table => :decimal,
                    :percent_slot => :decimal,
                    :total_points => :integer,
                    :total_ng_comp => :integer,
                    :adt => :integer,
                    :adl => :integer,
                    :days_without_play => :integer,
                    :wl_after_tax => :integer,
                    :buy_in => :integer,
                    :coin_in => :integer,
                    :credit_action => :string                    
                  }]
                }
              },
	      :to => :queryPlayerGamingTripSummary 
  def queryPlayerGamingTripSummary
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:playerGamingTripSummary => {:gaming_trip_summary => patron.gaming_trip_summary}}
  end

  soap_action "queryPlayerGamingTrip",
              :args   => {
                :gaming_trip_summary_id => :string
              },
              :return => {:playerGamingTrip => 
                {:gaming_trip => 
                  [{
                    :played_at => :dateTime,
                    :average_bet => :integer,
                    :percent_table => :decimal,
                    :percent_slot => :decimal,
                    :total_points => :integer,
                    :total_ng_comp => :integer,
                    :adt => :integer,
                    :adl => :integer,
                    :wl_after_tax => :integer,
                    :buy_in => :integer,
                    :coin_in => :integer,
                    :credit_action => :string                    
                  }]
                }
              },
	      :to => :queryPlayerGamingTrip 
  def queryPlayerGamingTrip
    gaming_trip_summary = GamingTripSummary.find(params[:gaming_trip_summary_id])
    render :soap => {:playerGamingTrip => {:gaming_trip => gaming_trip_summary.gaming_trips}}
  end
  
  soap_action "queryPlayerTableTripSummary",
              :args   => {
                :card_number => :string
              },
              :return => {:playerTableTripSummary => 
                {:table_trip_summary => 
                  [{
                    :id => :integer,
                    :start_at => :dateTime,
                    :end_at => :dateTime,
                    :duration => :integer,
                    :average_bet => :integer,
                    :total_buy_in => :integer,
                    :buy_in_cash => :integer,
                    :buy_in_check => :integer,
                    :buy_in_chip => :integer,
                    :win_loss => :integer,
                    :credit_action => :string
                  }]
                }
              },
	      :to => :queryPlayerTableTripSummary 
  def queryPlayerTableTripSummary
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:playerTableTripSummary => {:table_trip_summary => patron.table_trip_summary}}
  end
  
  soap_action "queryPlayerTableTrip",
              :args   => {
                :table_trip_summary_id => :string
              },
              :return => {:playerTableTrip => 
                {:table_trip => 
                  [{
                    :start_at => :dateTime,
                    :end_at => :dateTime,
                    :average_bet => :integer,
                    :total_buy_in => :integer,
                    :buy_in_cash => :integer,
                    :buy_in_check => :integer,
                    :buy_in_chip => :integer,
                    :win_loss => :integer,
                    :credit_action => :string
                  }]
                }
              },
	      :to => :queryPlayerTableTrip 
  def queryPlayerTableTrip
    table_trip_summary = TableTripSummary.find(params[:table_trip_summary_id])
    render :soap => {:playerTableTrip => {:table_trip => table_trip_summary.table_trips}}
  end
  
  soap_action "queryPlayerSlotTripSummary",
              :args   => {
                :card_number => :string
              },
              :return => {:playerSlotTripSummary => 
                {:slot_trip_summary => 
                  [{
                    :id => :integer,
                    :start_at => :dateTime,
                    :end_at => :dateTime,
                    :duration => :integer,
                    :average_bet => :integer,
                    :coin_in => :integer,
                    :coin_out => :integer,
                    :jackpot => :integer,
                    :theo_win_loss => :integer,
                    :total_loss => :integer,
                    :credit_action => :string
                  }]
                }
              },
	      :to => :queryPlayerSlotTripSummary 
  def queryPlayerSlotTripSummary
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:playerSlotTripSummary => {:slot_trip_summary => patron.slot_trip_summary}}
  end
  
  soap_action "queryPlayerSlotTrip",
              :args   => {
                :slot_trip_summary_id => :string
              },
              :return => {:playerSlotTrip => 
                {:slot_trip => 
                  [{
                    :start_at => :dateTime,
                    :duration => :integer,
                    :zone_location => :string,
                    :asset => :string,
                    :average_bet => :integer,
                    :coin_in => :integer,
                    :coin_out => :integer,
                    :pull_rate => :integer,
                    :theo_win_loss => :integer,
                    :total_loss => :integer,
                    :credit_action => :string
                  }]
                }
              },
	      :to => :queryPlayerSlotTrip 
  def queryPlayerSlotTrip
    slot_trip_summary = SlotTripSummary.find(params[:slot_trip_summary_id])
    render :soap => {:playerSlotTrip => {:slot_trip => slot_trip_summary.slot_trips}}
  end
  
  soap_action "queryEventRegistrations",
              :args   => {
                :card_number => :string
              },
              :return => {:eventRegistrationList => 
                {:event_registration => 
                  [{
                    :id => :integer,
                    :event_name => :string,
                    :event_type => :string,
                    :start_date => :dateTime,
                    :end_date => :dateTime,
                    :tickets_booked => :integer,
                    :tickets_available => :integer,
                    :pre_auth => :boolean,
                    :played => :boolean,
                    :status => :string,
                    :no_show => :boolean,
                    :code => :string,
                    :block => :string,
                    :center => :string,
                    :authorizer => :string,
                    :entered_by => :string                    
                  }]
                }
              },
	      :to => :queryEventRegistrations 
  def queryEventRegistrations
    patron = Patron.find_by_card_number(params[:card_number])
    render :soap => {:eventRegistrationList => {:event_registration => patron.event_registrations}}
  end
  
  soap_action "fetchEventRegistration",
              :args   => {
                :event_registration_id => :integer
              },
              :return => {:event_registration => 
                {
                    :id => :integer,
                    :event_name => :string,
                    :event_type => :string,
                    :start_date => :dateTime,
                    :end_date => :dateTime,
                    :tickets_booked => :integer,
                    :tickets_available => :integer,
                    :pre_auth => :boolean,
                    :played => :boolean,
                    :status => :string,
                    :no_show => :boolean,
                    :code => :string,
                    :block => :string,
                    :center => :string,
                    :authorizer => :string,
                    :entered_by => :string
                }
              },
	      :to => :fetchEventRegistration 
  def fetchEventRegistration
    event_registration = EventRegistration.find(params[:event_registration_id])
    render :soap => {:event_registration => event_registration}
  end

    soap_action "createEventRegistration",
              :args   => {:card_number => :string,
                :event_registration =>
                {
                    :id => :integer,
                    :event_name => :string,
                    :event_type => :string,
                    :start_date => :dateTime,
                    :end_date => :dateTime,
                    :tickets_booked => :integer,
                    :tickets_available => :integer,
                    :pre_auth => :boolean,
                    :played => :boolean,
                    :status => :string,
                    :no_show => :boolean,
                    :code => :string,
                    :block => :string,
                    :center => :string,
                    :authorizer => :string,
                    :entered_by => :string
                  }
              },
              :return => {
                    :event_registration_id => :integer
              },
	      :to => :createEventRegistration 
  def createEventRegistration
    patron = Patron.find_by_card_number(params[:card_number])
    event_registration = EventRegistration.new(params[:event_registration])
    event_registration.patron = patron
    event_registration.save
    render :soap => {:event_registration_id => event_registration.id}
  end
  
    soap_action "updateEventRegistration",
              :args   => {
                :event_registration_id => :integer,
                :event_registration =>
                {
                    :id => :integer,
                    :event_name => :string,
                    :event_type => :string,
                    :start_date => :dateTime,
                    :end_date => :dateTime,
                    :tickets_booked => :integer,
                    :tickets_available => :integer,
                    :pre_auth => :boolean,
                    :played => :boolean,
                    :status => :string,
                    :no_show => :boolean,
                    :code => :string,
                    :block => :string,
                    :center => :string,
                    :authorizer => :string,
                    :entered_by => :string
                  }
              },
              :return => {:event_registration_id => :integer
              },
	      :to => :updateEventRegistration 
  def updateEventRegistration
    event_registration = EventRegistration.find(params[:event_registration_id])
    event_registration.update_attributes(params[:event_registration])
    render :soap => {:event_registration_id => event_registration.id}
  end
  
  soap_action "deleteEventRegistration",
            :args   => {
              :event_registration_id => :integer
            },
            :return => {:event_registration_id => :integer
            },
            :to => :deleteEventRegistration 
  def deleteEventRegistration
    EventRegistration.find(params[:event_registration_id]).destroy
    render :soap => {:event_registration_id => params[:event_registration_id]}
  end
end
