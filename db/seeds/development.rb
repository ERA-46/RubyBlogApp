# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding the Development database ...'

eranda = User.first_or_create!(email: "erandairushan98@gmail.com", 
                            password: "password", 
                            password_confirmation: "password",
                            first_name: "Eranda",
                            last_name: "Irushan",
                            role: User.roles[:admin])

eraj = User.first_or_create!(email: "erajsan@gmail.com", 
                            password: "password", 
                            password_confirmation: "password",
                            first_name: "Eraj",
                            last_name: "Sanjaya")

Address.first_or_create!(street: "Rua Santa",
                        city: "São Paulo",
                        state: "SP",
                        zip: "01400",
                        country: "Brasil",
                        user: eranda)

Address.first_or_create!(street: "Rua Santa",
                        city: "São Paulo",
                        state: "SP",
                        zip: "01400",
                        country: "Brasil",
                        user: eraj)

category = Category.first_or_create!(name:"Uncategorized", display_in_nav: true)
Category.first_or_create!(name:"Categorized", display_in_nav: false)
Category.first_or_create!(name:"Car", display_in_nav: true)
Category.first_or_create!(name:"Bike", display_in_nav: true)


elapsed = Benchmark.measure do
    
    posts = []
    10.times do |i|
        puts "Creating post #{i}"
        post = Post.new(title: "Lorem ipsum #{i}", 
                body: "Lorem ipsum dolor sit amet, consectetur adipiscing #{i}", 
                user: eranda,
                category: category)

        
        5.times do |j|
            puts "Creating comment #{j} for post #{i}"
            post.comments.build(body: "Comment #{j}",
                            user: eraj)
        end
        posts.push(post)
    end
    Post.import(posts, recursive: true)
    #Comment.import(comments)
    #add activerecord gem with bundler
end
puts "Seeded time in development : #{elapsed.real} seconds"
