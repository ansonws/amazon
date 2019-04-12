# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
    created_at = Faker::Date.backward 365 * 5
    200.times do
        Product.create({

            title: Faker::Device.model_name,
            description: Faker::Device.manufacturer,
            price: rand(5000),
            created_at: created_at,
            updated_at: created_at
        })
end

puts Cowsay.say "Generated #{ Product.all.count } products", :ghostbusters