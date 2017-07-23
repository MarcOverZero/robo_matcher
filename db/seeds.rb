50.times do |i|
      user = User.create!(
        name: Faker::StarWars.droid,
        email: Faker::Internet.email,
        password: Faker::Internet.password
        )
      puts "User #{i}: #{user.name} - #{user.email} created!"
end
