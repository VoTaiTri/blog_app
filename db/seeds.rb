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
15.times do
	title = Faker::Lorem.word
  	content = Faker::Lorem.sentence(5)
  	users.each { |user| user.entries.create!(title:title, content: content) }
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Book.create!(name: "Book 1", author: "author 1")
Book.create!(name: "Book 2", author: "author 2")
Book.create!(name: "Book 3", author: "author 3")
Book.create!(name: "Book 4", author: "author 4")
Book.create!(name: "Book 5", author: "author 5")
Book.create!(name: "Book 6", author: "author 6")
Book.create!(name: "Book 7", author: "author 7")
Book.create!(name: "Book 8", author: "author 8")
Book.create!(name: "Book 9", author: "author 9")
Book.create!(name: "Book 10", author: "author 10")
Book.create!(name: "Book 11", author: "author 11")
Book.create!(name: "Book 12", author: "author 12")
Book.create!(name: "Book 13", author: "author 13")