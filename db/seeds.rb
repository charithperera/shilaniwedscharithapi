# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'guests_seed.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  info = row.to_hash

  new_guest = Guest.new
  new_guest.name = info["Guest"]
  new_guest.save

  new_rsvp = Rsvp.new
  new_rsvp.save

  new_guest.rsvp = new_rsvp

  invitation = Invitation.where(:pin => info["Pin"].to_i).first;

  if invitation.nil?
    new_invitation = Invitation.new
    new_invitation.pin = info["Pin"].to_i
    new_invitation.guests << new_guest
    new_invitation.save
  else
    invitation.guests << new_guest
    invitation.save
  end
end

# pin = 1_000_00 + Random.rand(10_000_00 - 1_000_00)
#
# chow_and_shash = Invitation.new
# chow_and_shash.pin = 123456
# chow_and_shash.save
#
# chow = Guest.new
# chow.name = "Chalana"
# chow.save
#
# shash = Guest.new
# shash.name = "Shashenka"
# shash.save
#
# chow_and_shash.guests << chow
# chow_and_shash.guests << shash
#
# chow_rsvp = Rsvp.new
# chow_rsvp.save
# shash_rsvp = Rsvp.new
# shash_rsvp.save
#
# chow.rsvp = chow_rsvp
# shash.rsvp = shash_rsvp
