# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chow_and_shash = Invitation.new
chow_and_shash.pin = 123456
chow_and_shash.save

chow = Guest.new
chow.name = "Chalana"
chow.save

shash = Guest.new
shash.name = "Shashenka"
shash.save

chow_and_shash.guests << chow
chow_and_shash.guests << shash

chow_rsvp = Rsvp.new
chow_rsvp.save
shash_rsvp = Rsvp.new
shash_rsvp.save

chow.rsvp = chow_rsvp
shash.rsvp = shash_rsvp
