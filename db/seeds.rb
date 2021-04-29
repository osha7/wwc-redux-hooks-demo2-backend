# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Musician.destroy_all
Song.destroy_all

aretha = Musician.create(name: "Aretha Franklin", origin: "Memphis, Tennessee", is_active: false)
nina = Musician.create(name: "Nina Simone", origin: "Tryon, North Carolina", is_active: false)
ella = Musician.create(name: "Ella Fitzgerald", origin: "Newport News, Virgina", is_active: false)

respect = Song.create(name: "Respect", musician_id: 1)
sinnerman = Song.create(name: "Sinnerman", musician_id: 2)
it_dont_mean_a_thing = Song.create(name: "It Don't Mean A Thing", musician_id: 3)