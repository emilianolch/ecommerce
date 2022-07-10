# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create(code: 1111, name: 'Samsung Galaxy A03', description: 'Dispositivo móvil de Tienda e-commerce',
               price: 39_000).photo.attach(io: File.open("#{Rails.root}/storage/seeds/samsung_galaxy_a03.webp"), filename: 'galaxy_a03.webp')
Product.create(code: 1112, name: 'Motorola Edge 20 Lite', description: 'Dispositivo móvil de Tienda e-commerce',
               price: 71_000).photo.attach(io: File.open("#{Rails.root}/storage/seeds/motorola_edge_20.webp"), filename: 'edge_20.webp')
