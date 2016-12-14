# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.create({
  name: "ruby",
  user_id: User.first.id,
  description: "ruby lesson",
  image: "http://www.rubyinside.com/wp-content/uploads/2007/10/ruby-logo.jpg",
  location: "melbourne",
  category: "education",
  price: 40,
  length: 60
})

Listing.create({
  name: "table-tennis",
  user_id: User.first.id,
  description: "Table Tennis lesson",
  image: "http://www.applecross.wa.edu.au/sites/default/files/images/Table-Tennis-535x350.jpg",
  location: "Sydney",
  category: "recreation",
  price: 30,
  length: 60
})

Listing.create({
  name: "photography",
  user_id: User.first.id,
  description: "Photography lesson",
  image: "http://www.mladiinfo.eu/wp-content/uploads/2016/09/photography-lens.jpg",
  location: "Hobart",
  category: "miscellaneous",
  price: 70,
  length: 120
})
