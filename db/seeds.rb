User.destroy_all
Profile.destroy_all

50.times do |i|
      user = User.create!(
        name: Faker::StarWars.droid,
        email: Faker::Internet.email,
        password: Faker::Internet.password
        )
      puts "User #{i}: #{user.name} - #{user.email} created!"

  profile = Profile.create!(
    photo: "https://robohash.org#{i}",
    location: Faker::Space.star,
    interest: Faker::Lorem.paragraph,
    classification: Faker::Space.galaxy,
    age: Faker::Number.between(66, 765),
    body_type: Faker::Measurement.weight,
    user_id: user.id
    )
    puts "Profile #{i}: #{profile.user_id}"
  end
