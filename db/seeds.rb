# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
200.times do
    created_at = Faker::Date.backward 1000
    Product.create({
        title: Faker::Food.dish,
        description: Faker::Food.description,
        price: rand(40),
        created_at: created_at,
        updated_at: created_at
    })
end

puts "Created 200 products"