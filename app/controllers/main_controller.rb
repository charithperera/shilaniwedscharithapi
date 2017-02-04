class MainController < ApplicationController
  def get_invitation
    response = {}
    invitation = Invitation.where(:pin => params[:pin].to_i).first;

    if invitation.nil?
      response[:result] = "Not Found"
    else
      guests = invitation.guests
      response[:result] = "Found"
      response[:guests] = []
      guests.each do |guest|
        guest_info = {}
        guest_info[:guest_id] = guest.id
        guest_info[:name] = guest.name
        guest_info[:rsvp_id] = guest.rsvp.id
        guest_info[:attend] = guest.rsvp.attend
        guest_info[:diet] = guest.rsvp.diet
        response[:guests] << guest_info
      end
    end

    render json: response
  end

  def submit_rsvp
    attending = params.select { |key| key.include? "attending" }
    diet = params.select { |key| key.include? "diet" }


    attending.each do |key, value|
      rsvp = Rsvp.where(:guest_id => key.split("-").first.to_i).first
      rsvp.attend = value
      rsvp.save
    end

    diet.each do |key, value|
      rsvp = Rsvp.where(:guest_id => key.split("-").first.to_i).first
      rsvp.diet = value
      rsvp.save
    end
  end
end
