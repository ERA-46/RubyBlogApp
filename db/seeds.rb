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

posts = []
comments = []


elapsed = Benchmark.measure do    
    100.times do |i|
        puts "Creating post #{i}"
        post = Post.create(title: "Lorem ipsum #{i}", 
                body: "Lorem ipsum dolor sit amet, consectetur adipiscing #{i}", 
                user_id: User.first.id)
        
        2.times do |j|
            puts "Creating comment #{j} for post #{i}"
            comment = Comment.create(body: "Comment #{j}",
                            user_id: User.second.id,
                            post_id: post.id)
        end
    end
end

Post.import(posts)
Comment.import(comments)
#add activerecord gem with bundler


puts "Elapsed time: #{elapsed.real} seconds"
