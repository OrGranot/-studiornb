# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying old studios"
Studio.destroy_all


puts "Creating studios"
30.times do
  Studio.new(
    name: Faker::Name.name,
    size: Faker::Number.decimal_part(digits: 2),
    equipment: Faker::Appliance.equipment,
    location: Faker::Nation.capital_city,
    description: Faker::Lorem.paragraph(sentence_count: 4),
  )
  Studio.user = User.last.id
  Studio.save!
end
