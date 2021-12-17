# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! :first_name => 'John', :last_name => "Doe", :email => 'test@test.com', :password => 'password', :password_confirmation => 'password', :longitude => 1, :latitude => 1
user2 = User.create! :first_name => 'John2', :last_name => "Doe2", :email => 'tes2t@test.com', :password => 'password', :password_confirmation => 'password', :longitude => 1.01, :latitude => 1
game = Game.create!(title: "Warhammer", short_title: "WHK", description: "Warhammer description" )

user.games = Game.all
user2.games = Game.all
user.save
user2.save