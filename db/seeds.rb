# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
respone = URI.open(url)
json = JSON.parse(respone.read)
movies = json['results']
movies.each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = movie['poster_path']
  rating = movie['vote_average']
  movie = Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  puts movie.title
end

List.create(name: "Drama")
List.create(name: "Thriller")
List.create(name: "Action")
