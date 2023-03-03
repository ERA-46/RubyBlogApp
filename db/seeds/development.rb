# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



def seed_users
    eranda = User.create(email: "erandairushan98@gmail.com", 
                                password: "password", 
                                password_confirmation: "password",
                                first_name: "Eranda",
                                last_name: "Irushan",
                                role: User.roles[:admin])

    eraj = User.create(email: "erajsan@gmail.com", 
                                password: "password", 
                                password_confirmation: "password",
                                first_name: "Eraj",
                                last_name: "Sanjaya")
end

def seed_address
    Address.create(street: "Rua Santa",
                            city: "São Paulo",
                            state: "SP",
                            zip: "01400",
                            country: "Brasil",
                            user: User.first)

    Address.create(street: "Rua Santa",
                            city: "São Paulo",
                            state: "SP",
                            zip: "01400",
                            country: "Brasil",
                            user: User.second)
end

def seed_categories
    Category.first_or_create!(name:"Uncategorized", display_in_nav: true)
    Category.first_or_create!(name:"Categorized", display_in_nav: false)
    Category.first_or_create!(name:"Car", display_in_nav: true)
    Category.first_or_create!(name:"Bike", display_in_nav: true)
end

def seed_posts_and_comments
    posts = []
    eranda = User.first
    eraj = User.second
    category= Category.first
    
    10.times do |i|
        puts "Creating post #{i+1}"
        post = Post.new(title: "Lorem ipsum #{i+1}", 
                body: "Lorem ipsum dolor sit amet, consectetur adipiscing #{i+1}", 
                user: eranda,
                category: category)

        
        5.times do |j|
            puts "Creating comment #{j+1} for post #{i+1}"
            post.comments.build(body: "Comment #{j+1}",
                            user: eraj)
        end
        posts.push(post)
    end
    Post.import(posts, recursive: true)
end

def seed_ahoy
    Ahoy.geocode = false
    request = OpenStruct.new(
        params: {},
        referer: 'http://example.com',
        remote_ip: '0.0.0.0',
        user_agent: 'Internet explorer',
        original_url: 'rails'

    )

    visit_properties = Ahoy::VisitProperties.new(request, api: nil)
    properties = visit_properties.generate.select{|_,v|v}

    example_visit = Ahoy::Visit::create!(properties.merge(
        visit_token: SecureRandom.uuid,
        visitor_token: SecureRandom.uuid,

    ))

    2.months.ago.to_date.upto(Date.today) do |date|
        Post.all.each do |post|
            rand(1..5).times do |i|
                Ahoy::Event.create!(name: 'Viewed Post',
                                    visit: example_visit,
                                    properties: {post_id: post.id},
                                    time: date.to_time + rand(0..23).hours + rand(0..59).minutes)
            end
        end
    end
end

elapsed = Benchmark.measure do
    puts 'Seeding the Development database ...'
    seed_users
    seed_address
    seed_categories
    seed_posts_and_comments
    seed_ahoy
end

puts "Seeded time in development : #{elapsed.real} seconds"
