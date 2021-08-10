# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
categories = [
    {name: "Outerwear", description: "Jackets, coats, etc"},
    {name: "Dress", description: "dfasdfasdfasdf"},
    {name: "Bottom", description: "dsdfdfasdf"},
    {name: "Sweatshirt", description: "dfasdsdfasdf"},
    {name: "Asssesories", description: "dfasdfasdfasdf"},
    {name: "Knitwear", description: "dfasdfasdfasdf"},
    {name: "Shoes", description: "dfasdfasdfasdf"}
]

features = ["Waterproof", "Vegan", "Tearproof", "Fireproof", "Sustainable", "Fair Trade Labour", "Genuine"]


if User.count == 0
    User.create(username: "Tester", email: "test@test.com", password: "password", password_confirmation: "")
end

if Category.count == 0
    categories.each do |category|
        Category.create(name: category[:name], description: category[:description])
        puts "created #{category[:name]} category"
    end
end

if Feature.count == 0
    features.each do |feature|
        Feature.create(name: feature)
        puts "Create #{feature} feature"
    end
end