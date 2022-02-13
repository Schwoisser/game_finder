# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if User.where(email: ['test@test.com', 'tes2t@test.com']).size == 0
  user = User.create! :first_name => 'John', :last_name => "Doe", :email => 'test@test.com', :password => 'password', :password_confirmation => 'password', :longitude => 1, :latitude => 1
  user2 = User.create! :first_name => 'John2', :last_name => "Doe2", :email => 'tes2t@test.com', :password => 'password', :password_confirmation => 'password', :longitude => 1.01, :latitude => 1

  game = Game.create!(title: "Warhammer", short_title: "WHK", description: "Warhammer description" )

  user.games = Game.all
  user2.games = Game.all
  user.save
  user2.save
end

if PlayerAttribute.all.size == 0
  PlayerAttribute.create!(title: "Sociable")
  PlayerAttribute.create!(title: "Helpful")
  PlayerAttribute.create!(title: "Knowledgeable")
  PlayerAttribute.create!(title: "Good Painter")
  PlayerAttribute.create!(title: "Fair Player")
end



languages = ["English", "German", "French", "Russian", "Polish"]

languages.each do |name|
  if Language.where(name: name).size == 0
    l = Language.create!(name: name)
    l.flag_image.attach(io: File.open(File.join(Rails.root,"app/assets/images/flags/#{name.downcase}.svg")), filename: "#{name.downcase}.svg")
    l.save
  end
end



