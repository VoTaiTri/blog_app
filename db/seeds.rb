User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
	title = Faker::Lorem.word
  	content = Faker::Lorem.sentence(5)
  	users.each { |user| user.entries.create!(title:title, content: content) }
end
