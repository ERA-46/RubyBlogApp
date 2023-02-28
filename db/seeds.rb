# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# User.create(email: "erandairushan98@gmail.com", 
#             password: "password", 
#             password_confirmation: "password",
#             name: "Eranda Irushan",
#             role: User.roles[:admin])

# User.create(email: "erajsan@gmail.com", 
#             password: "password", 
#             password_confirmation: "password",
#             name: "Eraj Sanjaya")



load(Rails.root.join('db', 'seeds', "#{Rails.env.downcase}.rb"))
#puts "Seeding database..."



# elapsed = Benchmark.measure do
    
#     posts = []
#     #comments = []
#     eranda = User.first
#     eraj = User.second

#     1000.times do |i|
#         puts "Creating post #{i}"
#         post = Post.new(title: "Lorem ipsum #{i}", 
#                 body: "Lorem ipsum dolor sit amet, consectetur adipiscing #{i}", 
#                 user: eranda)
        
#         10.times do |j|
#             puts "Creating comment #{j} for post #{i}"
#             post.comments.build(body: "Comment #{j}",
#                             user: eraj)
#         end
#         posts.push(post)
#     end
#     Post.import(posts, recursive: true)
#     #Comment.import(comments)
#     #add activerecord gem with bundler
# end
# puts "Elapsed time: #{elapsed.real} seconds"
