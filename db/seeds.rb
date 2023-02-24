# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "erandairushan98@gmail.com", 
            password: "password", 
            password_confirmation: "password",
            name: "Eranda Irushan",
            role: User.roles[:admin])

User.create(email: "erajsan@gmail.com", 
            password: "password", 
            password_confirmation: "password",
            name: "Eraj Sanjaya")
    
10.times do |i|
    post = Post.create(title: "Lorem ipsum #{i}", 
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing #{i}", 
            user_id: User.first.id)
    
    5.times do |j|
    Comment.create(body: "Comment #{j}",
                    user_id: User.second.id,
                    post_id: post.id)
    end
end