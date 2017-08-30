# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.new(name: "Daniel Junior", email: "danieljunior@id.uff.br", password: "123456", password_confirmation: "123456")
user.save
user.confirm

10.times {
  u = User.new
  u.name= Faker::Name.name
  u.description= Faker::Lorem.paragraph
  u.email= Faker::Internet.email
  u.password= "123456"
  u.password_confirmation= "123456"

  tweets = []
  10.times {
    tweet = Tweet.new
    tweet.content= Faker::Lorem.sentence
    tweets << tweet
  }

  u.tweets = tweets
  u.save
  u.confirm
}