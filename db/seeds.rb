# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create name: 'Gaming', priority: 1, image: 'https://www.fosi.org/media/images/22601782810_cbe3ede5f5_o.focus-none.original.jpg'
Category.create name: 'Classic', priority: 2, image: 'https://ligalive.net/wp-content/uploads/2020/03/no-football-on-tv-corona-meme-1200x1200.png'
Category.create name: 'New', priority: 3, image: 'https://duffy.agency/wp-content/uploads/2019/05/example-of-Dos-Equis-meme.png'
Category.create name: 'Programming', priority: 4, image: 'https://digitalsynopsis.com/wp-content/uploads/2018/10/funny-memes-for-designers-2.jpg'
bender = User.create name: 'Bender', email: 'geromorla@yahoo.com.ar', password: '123456', password_confirmation: '123456'
bender.articles.create title: 'Bender', text: 'I\'m the greatest character ever created. Bite my shiny metal ass', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'bender-drink.jpg')), category_ids: [1, 2, 3, 4]
